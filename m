From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 21 Mar 2019 21:43:44 +0000
Subject: [PATCH] auto filter aio tests of libc can't support aio
References: <20190318181940.GA5494@dell5510>
 <1552939602-22335-1-git-send-email-vgupta@synopsys.com>
 <20190320224833.GA7254@dell5510>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014643DB78@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 3/20/19 3:48 PM, Petr Vorel wrote:
>> +ifndef HAVE_LIBAIO_H
>> +FILTER_OUT_DIRS	+= aio
>> +endif
> This is IMHO wrong, as all files using libaio.h are guarded with
> TST_TEST_TCONF().

You're right. It seems this ltp tree of mine had stray aio1 and aio2 dir in the
io/aio which was actually tripping the build. With a pristine tree that is indeed
not needed.

Thx,
-Vineet
