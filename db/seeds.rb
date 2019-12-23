# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password")
              
User.first.tasks.create!( title: "test title1",
              body: "test body1")