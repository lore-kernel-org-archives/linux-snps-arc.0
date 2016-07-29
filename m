From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 28 Jul 2016 20:23:18 -0700
Subject: Build failure in linux mainline when building arcv2 images
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <579ACC26.9020106@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

Mainline fails to build arcv2 images with the following error.

{standard input}: Assembler messages:
{standard input}:19174: Error: Instruction with long immediate data in delay slot
make[2]: *** [block/cfq-iosched.o] Error 1

Bisect points to commit 9a7f38c42c2 ("cfq-iosched: Convert from jiffies to nanoseconds"),
but I don't really hold it responsible. It looks more like a compiler / binutils problem
to me.

I am using a toolchain built with buildroot (gcc 4.8.3). Is there a more recent toolchain
than the one in buildroot available, by any chance ? If yes, where do I find it ?

Thanks,
Guenter
