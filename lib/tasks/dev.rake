namespace :dev do
  desc 'Seed data for development environment'
  task prime: 'db:setup' do
    unless Rails.env.development?
      raise 'This task can only be run in the development environment'
    end

    Rsvp::Data::Loader.persist!
  end
end

module Rsvp
  module Data
    PEOPLE_NAMES = [
      'Edward Loveall',
      'Elizabeth Kowalski',
      'Nicole Aquillano',
      'Sam Aquillano',
      'Katie Chin',
      'Grace Forster',
      'Jason Forster',
      'Ashley Hoxeng',
      'Taylor Hoxeng',
      'Jennifer Loveall-Forster',
      'Cailyn Graham',
      'Claire Graham',
      'Lauren Graham',
      'Shawn Graham',
      'Joan Kowalski',
      'John Kowalski',
      'Diana Loveall',
      'Kathie Loveall',
      'Elizabeth Marriott',
      'Hanna Marriott',
      'John Marriott',
      'Ramona Hummel',
      'Derek Remes',
      'Drew Saunders',
      'Tara Saunders',
      'Hunter Elliott',
      'Igor Stolarsky',
      'Jean Yang'
    ]

    EMAILS = [
      'sam@aquillano.com',
      'katie@chin.com',
      'jennifer@forster.com',
      'lauren@graham.com',
      'joan@kowalski.com',
      'diana@loveall.com',
      'kathie@loveall.net',
      'john@marriot.co.fl',
      'derek@gmail.com',
      'tara@saunders.com',
      'huntgor@stelliott.com',
      'jean@mit.edu'
    ]

    class Loader
      def self.persist!
        data = new()
        data.people!
        data.invites!
      end

      def people!
        Rsvp::Data::PEOPLE_NAMES.each do |name|
          person = Person.create(name: name)
          person.choice = Choice.create
        end
      end

      def invites!
        Rsvp::Data::EMAILS.each do |email|
          people = Person.all.sample(rand(2..4))
          invite = Invite.create(email: email, people: people)
          invite.generate_token!
        end
      end
    end
  end
end
