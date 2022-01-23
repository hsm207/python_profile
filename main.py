from rasa.core.policies.rule_policy import RulePolicy
from rasa.shared.core.domain import Domain
from rasa.shared.core.events import ActionExecuted, UserUttered
from rasa.shared.core.trackers import DialogueStateTracker
from rasa.shared.nlu.interpreter import RegexInterpreter
import time

# @profile # uncomment this line if you want to run make line-profile or mem-profile
def problem_function():
    pred = rule_policy.predict_action_probabilities(conv, domain, RegexInterpreter())
    return pred


domain = Domain.load("core/domain.yml")
rule_policy = RulePolicy.load("core/policy_1_RulePolicy")

conv = DialogueStateTracker.from_events(
    "demo user",
    evts=[
        ActionExecuted("action_listen"),
        UserUttered("/onboarding", {"name": "onboarding"}),
    ],
)


if __name__ == "__main__":
    print("Sleeping for 5 seconds before calling the problem function")
    time.sleep(5)
    print("Calling problem_function() 10 times")
    for _ in range(10):
        problem_function()
