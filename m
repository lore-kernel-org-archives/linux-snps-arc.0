From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 10 Aug 2016 10:22:22 -0700
Subject: Problems building arc-2016.09-eng007 toolchain with 2.6.35 kernel
 headers
In-Reply-To: <20160810170333.GS22524@waldemar-brodkorb.de>
References: <CAGXr9JG_P19fWQMtGN7gzJ7SYOVy=b=8DiD9M8++6_wngZ8NvA@mail.gmail.com>
 <7a1076af-3db3-7c92-c6bd-9b67cca6422c@synopsys.com>
 <20160810170333.GS22524@waldemar-brodkorb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8053f41e-055b-051e-7b2f-5a446c2b947e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/10/2016 10:03 AM, Waldemar Brodkorb wrote:
>>> 2) Is uclibc-ng 1.0.17 supposed to be compatible with 2.6.x kernel headers?
>> > 
>> > No - modern/upstream uClibc-ng is not compatible with 2.6.35
>> > You need to use the uClibc of the time - with pairing gcc/binutils - although that
>> > will be a can of worms
> This is only the case for ARC, right?
> Other architectures should work fine, like MIPS or ARM.

Perhaps they will - I'm not sure. ARC certainly has issues due to the syscall ABI
change from 2.6.35 to upstream 3.8 !

-Vineet
