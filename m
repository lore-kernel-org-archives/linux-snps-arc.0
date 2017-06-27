From: fweimer@redhat.com (Florian Weimer)
Date: Tue, 27 Jun 2017 14:01:32 +0200
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <2b02c462-44c4-02bb-6989-b3572834432e@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <3bd8b935-47c0-f190-ee6b-3d08e2f3a752@redhat.com>
 <2b02c462-44c4-02bb-6989-b3572834432e@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e0b3a866-beed-b3c4-e0c8-37d074eed4a5@redhat.com>
To: linux-snps-arc@lists.infradead.org

On 06/27/2017 01:55 PM, Vineet Gupta wrote:
> On 06/27/2017 02:29 PM, Florian Weimer wrote:
>> On 06/27/2017 10:00 AM, Vineet Gupta wrote:
>>> diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions
>>> b/sysdeps/unix/sysv/linux/arc/shlib-versions
>>> new file mode 100644
>>> index 000000000000..c4d5d029812d
>>> --- /dev/null
>>> +++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
>>> @@ -0,0 +1,2 @@
>>> +DEFAULT                 GLIBC_2.21
>>> +ld=ld-linux.so.2
>>
>> Is there a reason why you set the ABI baseline to GLIBC_2.21?  Why not
>> GLBIC_2.26?
> 
> No real reason, perhaps this is the version where we started off of.
> I'll change this - and other places to 2.26 !

Great.  Note that this will cause problems with some tests which
exercise compatibility symbols.  I still want to contribute the build
system changes required to support them, but I probably won't be able to
make the July 1st deadline.

(Realistically, I'd need a port which can build with
build-many-glibcs.py for that anyway.)

Thanks,
Florian
