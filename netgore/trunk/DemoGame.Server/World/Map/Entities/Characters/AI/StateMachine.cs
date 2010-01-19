﻿using System;
using System.Linq;
using DemoGame.AI;
using NetGore;
using NetGore.AI;

namespace DemoGame.Server
{
    //AIID 2 - Simple state machine algorithms that will make decisions beased on predefined logic.  Sidescroller ONLY at the moment.

    #region Topdown AI Algorithm

#if TOPDOWN //Top down AI Algorithm
    [AI(_id)]
    class StateMachine : AIBase
    {

            public enum State
        {
            Evade,
            Patrol,
            Attack,
            Idle
        }

        const int _id = 2;
        const bool AIIDLE = true;
        const int _targetUpdateRate = 1000;
        //int _lastTargetUpdateTime = int.MinValue;   Commented to hide warning of assigned but never used.
            
        public StateMachine(Character actor) : base(actor)
        {
        }

        /// <summary>
        /// When overridden in the derived class, gets the ID of this AI.
        /// </summary>
        public override AIID ID
        {
            get { return new AIID(_id); }
        }

        protected override void DoUpdate()
        {
        }
            //TODO: Implement.
    }
#endif

    #endregion

    #region Sidescroller AI Algorithm

#if !TOPDOWN //The Sidescroller AI Algorithm.
    [AI(_id)]
    class StateMachine : AIBase
    {
        public enum State
        {
            Evade,
            Patrol,
            Attack,
            Idle
        }

        const int _id = 2;
        const int _UpdateRate = 2000;
        State _characterState = State.Patrol;
        int _lastUpdateTime = int.MinValue;
        float _lastX;
        Character _target;
        bool _isAttackingTarget;

        /// <summary>
        /// Initializes a new instance of the <see cref="StateMachine"/> class.
        /// </summary>
        /// <param name="actor">Character for this AI module to control.</param>
        public StateMachine(Character actor) : base(actor)
        {
            //Adds an event handler so we know when the actor has been attacked.
            Actor.OnAttackedByCharacter += new CharacterAttackCharacterEventHandler(Actor_OnAttackedByCharacter);
        }

        /// <summary>
        /// When overridden in the derived class, gets the ID of this AI.
        /// </summary>
        public override AIID ID
        {
            get { return new AIID(_id); }
        }

        /// <summary>
        /// Called when the target is killed.  It resets whether the Actor should be trying to attack the _target.
        /// </summary>
        /// <param name="character">The character that is killed</param>
        void _target_OnKilled(Character character)
        {
            //Stop attacking target. Job done.
            _isAttackingTarget = false;
        }

        /// <summary>
        /// Called when a character attacks the Actor. It checks certain criteria before trying to
        /// attack the attacker.
        /// </summary>
        /// <param name="attacker">The character that attacked the Actor</param>
        /// <param name="attacked">This field would be equal to Actor in this class.</param>
        /// <param name="damage">Amount of damage caused during attack.</param>
        void Actor_OnAttackedByCharacter(Character attacker, Character attacked, int damage)
        {
            //Set the _target as the attacker.
            _target = attacker;

            //Set up event handler for when the _target dies.
            _target.OnKilled += new CharacterEventHandler(_target_OnKilled);

            //Adds some logic where if the Actors HP is below an amount the Actor tries to run away.
            if (Actor.HP <= 10)
            {
                _isAttackingTarget = false;
                _characterState = State.Evade;
                return;
            }

            //Sets the Actor to attack the _target.
            _isAttackingTarget = true;
            _characterState = State.Attack;

        }

        /// <summary>
        /// Handles the real updating of the AI.
        /// </summary>
        protected override void DoUpdate()
        {
            //Updates a few variables that don't need to be updated every frame
            //and calls the EvaluateState method
            int time = GetTime();
            if (_lastUpdateTime + _UpdateRate < time)
            {
                _lastUpdateTime = time;
                _lastX = Actor.Position.X;
                EvaluateState();
            }

            //Updates the Actor depending on its current state.
            UpdateState(_characterState);
        }
        
        /// <summary>
        /// Uses a criteria to change the current state of the Actor. 
        /// This is where the main logic for this class is held in terms of how the AI responds.
        /// </summary>
        void EvaluateState()
        {
            
            if (_target != null)
            {
                //This is so that the Character has the opportunity to evade this Actor
                if (_target.GetDistance(Actor) > 50)
                { _isAttackingTarget = false; }

                if (_isAttackingTarget)
                {
                    //We have a hostile target so lets Attack them.
                    _characterState = State.Attack;
                }
                else
                {
                    //There is no hostile target therefore just Patrol.
                    _isAttackingTarget = false;
                    _characterState = State.Patrol;

                }
            }
            else
            {
                //Just patrol if there is no _target.
                _isAttackingTarget = false;
                _characterState = State.Patrol;
            }
        }
       
        /// <summary>
        /// Updates the Actor depending on its current state. Should only be called from DoUpdate().
        /// </summary>
        /// <param name="CurrentState">The CurrentState of the actor.</param>
        void UpdateState(State CurrentState)
        {
            //If the AI has been disabled just set to Idle and ignore anything else.
            if (AISettings.AIDisabled)
            { CurrentState = State.Idle; }

            switch (CurrentState)
            {
                case State.Idle:
                    if (Actor.IsMoving)
                        Actor.StopMoving();
                    break;
                case State.Attack:
                    ChaseTarget();
                    break;
                case State.Evade:
                    EvadeTarget();
                    break;
                case State.Patrol:
                    Patrol();
                    break;
            }
        }

        /// <summary>
        /// Chases the target by checking where abouts the _target is in relation to the Actor.
        /// </summary>
        public void ChaseTarget()
        {
            //Checks whether the _target is above the Actor.
            if (_target.Position.Y < Actor.Position.Y)
            {
                //_target above
                //Jump first (so we can move left and right while in the air)
                Actor.Jump();

                //Move right because _target is to the right.
                if (_target.Position.X > Actor.Position.X)
                {
                    Actor.SetHeading(Direction.West);
                    Actor.MoveRight();
                }

                //Move left becuase target is to the left.
                if (_target.Position.X < Actor.Position.X)
                {
                    Actor.SetHeading(Direction.East);
                    Actor.MoveLeft();
                }
            }

            if (_target.Position.Y > Actor.Position.Y)
            {
                //_target below
                if (_target.Position.X >= Actor.Position.X)
                {
                    Actor.SetHeading(Direction.West);
                    Actor.MoveRight();
                }

                if (_target.Position.X <= Actor.Position.X)
                {
                    Actor.SetHeading(Direction.East);
                    Actor.MoveLeft();
                }
            }

            int YDifference = Convert.ToInt32((_target.Position.Y - Actor.Position.Y));

            if ((YDifference <=5) & (YDifference >= -5))
            {
                //target is level
                if (_target.Position.X >= Actor.Position.X)
                {
                    Actor.SetHeading(Direction.West);
                    Actor.MoveRight();
                }

                if (_target.Position.X <= Actor.Position.X)
                {
                    Actor.SetHeading(Direction.East);
                    Actor.MoveLeft();
                }
            }

            if (Actor.Position.X == _lastX)
            {
                if (_lastUpdateTime + 5000 < GetTime()) //Only execut this after 5 seconds.
                {
                    if (Actor.IsMovingRight)
                    {
                        Actor.SetHeading(Direction.West);
                        Actor.Jump();
                        Actor.MoveLeft();
                    }
                    if (Actor.IsMovingRight)
                    {
                        Actor.SetHeading(Direction.East);
                        Actor.Jump();
                        Actor.MoveRight();
                    }
                }
            }

            if (IsInMeleeRange(_target))
            {
                Actor.StopMoving();
                Actor.Attack();
            }
        }
        
        public void EvadeTarget()
        {
            //Opposite of chase logic.

            if (_target.Position.Y >= Actor.Position.Y)
            {
                //_target above
                Actor.Jump();

                if (_target.Position.X <= Actor.Position.X)
                {
                    Actor.SetHeading(Direction.West);
                    Actor.MoveRight();
                }
                if (_target.Position.X >= Actor.Position.X)
                {
                    Actor.SetHeading(Direction.East);
                    Actor.MoveLeft();
                }
            }

            if (_target.Position.Y <= Actor.Position.Y)
            {
                //_target below
                if (_target.Position.X <= Actor.Position.X)
                {
                    Actor.SetHeading(Direction.West);
                    Actor.MoveRight();
                }

                if (_target.Position.X > Actor.Position.X)
                {
                    Actor.SetHeading(Direction.East);
                    Actor.MoveLeft();
                }
            }

            int YDifference = Convert.ToInt32((_target.Position.Y - Actor.Position.Y));

            if ((YDifference <= 5) & (YDifference >= -5))
            {
                //target is level
                if (_target.Position.X < Actor.Position.X)
                {
                    Actor.SetHeading(Direction.West);
                    Actor.MoveRight();
                }

                if (_target.Position.X > Actor.Position.X)
                {
                    Actor.SetHeading(Direction.East);
                    Actor.MoveLeft();
                }
            }

            if (Actor.Position.X == _lastX + 20)
            {
                if (_lastUpdateTime + 5000 < GetTime()) //Only execut this after 5 seconds.
                {
                    if (Actor.IsMovingRight)
                    {
                        Actor.SetHeading(Direction.West);
                        Actor.Jump();
                        Actor.MoveLeft();
                    }
                    if (Actor.IsMovingRight)
                    {
                        Actor.SetHeading(Direction.East);
                        Actor.Jump();
                        Actor.MoveRight();
                    }
                }
            }

            if (IsInMeleeRange(_target))
            {
                Actor.StopMoving();
                Actor.Attack();
            }
        }

        public void Patrol()
        {
            //Move randomly.
            if (Rand(0, 40) == 0)
            {
                if (Actor.IsMoving)
                    Actor.StopMoving();
                else
                {            
                    if ((Rand(0, 55) == 0))
                    { Actor.Jump(); }
                    
                    if (Rand(0, 2) == 0)
                    { Actor.MoveLeft(); }
                    else
                    { Actor.MoveRight(); }
                }
            }

            
            
        }
    }
#endif

    #endregion
}