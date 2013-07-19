Feature: Basic reading and writing to a journal

    Scenario: Loading a sample journal
        Given we use the config "basic.json"
        When we run "jrnl -n 2"
        Then we should get no error
        And the output should be
            """
            2013-06-09 15:39 My first entry.
            | Everything is alright

            2013-06-10 15:40 Life is good.
            | But I'm better.
            """

    Scenario: Writing an entry from command line
        Given we use the config "basic.json"
        When we run "jrnl 23 july 2013: A cold and stormy day. I ate crisps on the sofa."
        Then the output should contain "Entry added"
        When we run "jrnl -n 1"
        Then the output should contain "2013-07-23 09:00 A cold and stormy day."

    Scenario: Emoji support
        Given we use the config "basic.json"
        When we run "jrnl 23 july 2013: 🌞 sunny day. Saw an 🐘"
        Then the output should contain "Entry added"
        When we run "jrnl -n 1"
        Then the output should contain "🌞"
        and the output should contain "🐘"
