# frozen_string_literal: true

class Ability
  include CanCan::Ability

def initialize(user)
 if user.role.code == 'admin'
  
  can :read, Project
  can :create, Project
  can :update, Project
  can :destroy,Project

  can :read, Salary
  can :create ,Salary
  can :update ,Salary
  can :destroy ,Salary

  can :read , EmpAttendance

  can :read, Holiday
  can :create, Holiday
  can :update, Holiday

  can :read ,Break
  can :update, Break
  can :destroy, Break
  elsif  user.role.code == 'employee'
  can :read ,Break
  can :create, Break
  can :update, Break

  can :read, Salary
  can :read, Project
  can :read, Holiday
  can :read, EmpAttendance
  can :create, EmpAttendance
  end
  end
end

