class Ability
  include CanCan::Ability

  # Defines permissions for each user role.
  #
  # == Not signed in:
  # If the user is not signed in, they cannot do *anything*. They are simply
  # redirected to the login / signup page
  #
  # == Studnets can manage most things
  # If the user is signed in as a student, they can:
  #
  #   * Read and pin all projects
  #   * Manage resources which they own
  #   * Read resources which they don't own
  #
  # == Teachers can do anything
  # If the user is signed in as a teacher, they can:
  # 
  #   * Manage projects
  #   * Manage resources
  #   
  # Read more here: https://github.com/CanCanCommunity/cancancan/blob/develop/docs/Defining-Abilities.md
  def initialize(user)
    return unless user.present?

    if user.student? or user.teacher?
      # Students and teachers can read and pin projects
      can [:read, :students, :pinned], Project
      can :manage, Pin, user: user

      # Stduent and teachers can read resources
      can :read, Resource
      # Stduent and teachers can manage their own resources
      can :manage, Resource, user: user

      # Students and teachers can discuss ideas
      can [:read, :create], Chat

      # Students and teachers can read milestones
      can :read, Milestone
    end

    if user.teacher?
      # Teachers can do anything they want
      can :manage, :all
    end
  end
end
