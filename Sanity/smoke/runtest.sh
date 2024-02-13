#!/bin/bash
# Author: Mikolaj Izdebski <mizdebsk@redhat.com>
. /usr/share/beakerlib/beakerlib.sh

rlJournalStart

  rlPhaseStartTest "check for presence of ant command"
    rlAssertRpm ant
    rlAssertBinaryOrigin ant ant
  rlPhaseEnd

  rlPhaseStartTest "display Ant version"
    rlRun -s "ant -version"
    rlAssertGrep "^Apache Ant(TM) version " $rlRun_LOG
  rlPhaseEnd

  rlPhaseStartTest "display Ant help"
    rlRun -s "ant -help"
    rlAssertGrep "use given file for log" $rlRun_LOG
  rlPhaseEnd

  rlPhaseStartTest "display Ant diagnostics"
    rlRun -s "ant -diagnostics"
    rlAssertGrep "Locale information" $rlRun_LOG
  rlPhaseEnd

  rlPhaseStartTest "display hello world"
    rlRun -s "ant -v -f hello.xml hello"
    rlAssertGrep "Hello, world" $rlRun_LOG
    rlAssertGrep "BUILD SUCCESSFUL" $rlRun_LOG
  rlPhaseEnd

  rlPhaseStartTest "build simple project"
    rlAssertRpm ant-junit
    rm -rf build
    rlRun -s "ant -v clean"
    rlAssertNotExists build
    rlRun -s "ant -v test javadoc"
    rlAssertGrep "Running tt.MyTest" $rlRun_LOG
    rlAssertGrep "Tests run: 1, Failures: 0, Errors: 0, Skipped: 0" $rlRun_LOG
    rlAssertGrep "BUILD SUCCESSFUL" $rlRun_LOG
    rlAssertExists build/main/tt/My.class
    rlAssertExists build/test/tt/MyTest.class
    rlAssertExists build/javadoc/index.html
    rlAssertExists build/javadoc/tt/My.html
    rlRun -s "ant -v run -Darg1=42 -Darg2=59"
    rlAssertGrep "RESULT is 101" $rlRun_LOG
    rlAssertGrep "BUILD SUCCESSFUL" $rlRun_LOG
    rlRun -s "ant -v run-nofork -Darg1=42 -Darg2=60"
    rlAssertGrep "RESULT is 102" $rlRun_LOG
    rlAssertGrep "BUILD SUCCESSFUL" $rlRun_LOG
    rlRun -s "ant -v clean"
    rlAssertNotExists build
  rlPhaseEnd

rlJournalEnd
rlJournalPrintText
