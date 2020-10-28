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
    return unless user.present? and user.student?
    # Students can read and pin projects
    can [:read, :pinned], Project
    can :manage, Pin, user: user

    # Stduents can read resources
    can :read, Resource
    # Stduents can manage their own resources
    can :manage, Resource, user: user

    return unless user.teacher?
    can :manage, :all
  end
end
