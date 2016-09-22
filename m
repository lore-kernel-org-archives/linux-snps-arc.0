From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 22 Sep 2016 13:39:06 -0700
Subject: [PATCH 0/3] ARC unwinder switch to .eh_frame
In-Reply-To: <2aa8d6d7-b489-e51e-dc18-fceb5300f6d2@synopsys.com>
References: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
 <CAE2F3rA0FrrNiHe6W6DSqYmpTyTiVD3h-wpGtW7rJ07RJLqqgw@mail.gmail.com>
 <2aa8d6d7-b489-e51e-dc18-fceb5300f6d2@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <758f899b-0b12-cfe5-225f-8764368a8b6d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On 09/19/2016 11:13 PM, Vineet Gupta wrote:
> On 09/19/2016 06:21 PM, Daniel Mentz wrote:
>> > Hi Vineet,
>> > 
>> > Thank you for your patches. I applied them, and verified that
>> > unwinding works with code that is compiled into the kernel image as
>> > well as kernel modules.
>> > I confirmed that the .eh_frame section is present and that the
>> > .debug_frame section is absent. I also verified that the file size of
>> > the .ko files are small enough for our embedded platform and that
>> > unnecessary sections like .debug_info, .debug_line, .debug_str etc.
>> > are also absent.
>> > Is there anything else you want me to test?
>> > Thanks
>> > Daniel
> Nope - that is it. Just wanted to make sure it is "field" tested :-)
> 
> Thx,
> -Vineet

FYI - I've pushed some more changes to unwinding department so that we get
call-traces for memset/memcpy et al.

git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git  #for-next

-Vineet
