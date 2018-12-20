From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 13:22:52 -0800
Subject: test related questions (was Re: [PATCH 00/21] glibc port to ARC
 processors)
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <70d4ad50-ac0a-1f75-ee5f-537ba67570a8@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 1:04 PM, Vineet Gupta wrote:
> (a) build-many-glibcs.py check results are clean
> 
> | Summary of test results:
> |   1173 PASS
> |      15 XFAIL
> |
> | PASS: glibcs-arc-linux-gnu check

One of the issues in running build-many incrementally, i.e. "host-libraries",
"compilers" only once but "glibcs" again to quickly test fixes is that for 2nd
run, target c++ compiler is picked up for support/links-dso-program vs.
links-dso-program-c which fails as the cpp headers are not present. Is there a
solution to that ?


> (b) Full testsuite ran in a cross compile setup using buildroot on HSDK development
>     platform.
> 
> Summary of test results:
>      24 FAIL
>    5124 PASS
>      27 UNSUPPORTED
>      19 XFAIL

One of the pesky issues with cross testing is localedata/gen-locale.sh kicking on
 target, which despite being 1GHz gets in the way of quick iterations. Is there a
way to build those on host and simply reference/install them on target. I
understand this is more of a buildsystem question (buildroot), but any pointers
would be appreciated.
