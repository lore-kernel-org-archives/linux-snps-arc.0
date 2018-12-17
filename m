From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 17 Dec 2018 15:23:32 -0800
Subject: [PATCH] testsuite fix: timezone: failing due to permissions in
 cross testing
In-Reply-To: <aeac2d7e-bbe6-9b88-007b-9881cfbcf83a@cs.ucla.edu>
References: <1545088170-24103-1-git-send-email-vgupta@synopsys.com>
 <aeac2d7e-bbe6-9b88-007b-9881cfbcf83a@cs.ucla.edu>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e82343ae-0a7d-1634-6f1e-fb6edf747df8@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/17/18 3:17 PM, Paul Eggert wrote:
> 
>> ? #ifdef S_IRUSR
>> -#define MKDIR_UMASK (S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IXGRP|S_IROTH|S_IXOTH)
>> +#define MKDIR_UMASK
>> (S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IWGRP|S_IXGRP|S_IROTH|S_IWOTH|S_IXOTH)
>> ? #else
>> ? #define MKDIR_UMASK 0755
>> ? #endif
> 
> The zic.c code is taken from upstream, and I'm loath to change it everywhere
> simply because a glibc test driver isn't working somewhere, as I expect this would
> lead to security holes elsewhere. Intead, how about changing the test script to
> chmod the testdata directory after zic creates it, or to segregate the tzdata
> directory from the other test results?

OK, the idea here was to solicit ideas about how to go about addressing this. I
need to dig into the test harness to see how it can be addressed in the way you
suggest.

Thx,
-Vineet
