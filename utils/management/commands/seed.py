from django.contrib.auth import get_user_model
from django.core.management import call_command
from django.core.management.base import BaseCommand
from os import environ
from polls.models import Question, Choice


class Command(BaseCommand):
    help = "Seed the database with some questions and choices."

    def handle(self, *args, **options):
        if environ.get('ENVIRONMENT') == 'development':
            call_command('flush', '--noinput')

        # Create superusers
        get_user_model().objects.create_superuser(
            username="admin",
            email="admin@example.com",
            password="admin",
        )

        # Create questions
        q1 = Question.objects.create(
            question_text="What's new?",
            pub_date="2019-01-01 00:00:00",
        )
        q2 = Question.objects.create(
            question_text="What's up?",
            pub_date="2019-02-02 00:00:00",
        )

        # Create choices
        q1.choice_set.create(choice_text="Not much", votes=0)
        q1.choice_set.create(choice_text="The sky", votes=0)
        q1.choice_set.create(choice_text="Just hacking again", votes=0)
        q2.choice_set.create(choice_text="Just fine", votes=0)
        q2.choice_set.create(choice_text="The ceiling", votes=0)
        q2.choice_set.create(choice_text="Same old, same old", votes=0)

        # Print success message
        self.stdout.write(self.style.SUCCESS("Successfully seeded database."))
