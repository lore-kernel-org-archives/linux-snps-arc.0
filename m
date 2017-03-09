From: rob@landley.net (Rob Landley)
Date: Wed, 8 Mar 2017 22:16:49 -0600
Subject: [PATCH 1/3] futex: remove duplicated code
In-Reply-To: <20170304130550.GT21222@n2100.armlinux.org.uk>
References: <20170303122712.13353-1-jslaby@suse.cz>
 <20170304130550.GT21222@n2100.armlinux.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <23e5808b-2a20-518d-b49a-4d95dd23cfde@landley.net>
To: linux-snps-arc@lists.infradead.org

On 03/04/2017 07:05 AM, Russell King - ARM Linux wrote:
> On Fri, Mar 03, 2017@01:27:10PM +0100, Jiri Slaby wrote:
>> diff --git a/kernel/futex.c b/kernel/futex.c
>> index b687cb22301c..c5ff9850952f 100644
>> --- a/kernel/futex.c
>> +++ b/kernel/futex.c
>> @@ -1457,6 +1457,42 @@ futex_wake(u32 __user *uaddr, unsigned int flags, int nr_wake, u32 bitset)
>>  	return ret;
>>  }
>>  
>> +static int futex_atomic_op_inuser(int encoded_op, u32 __user *uaddr)
>> +{
>> +	int op = (encoded_op >> 28) & 7;
>> +	int cmp = (encoded_op >> 24) & 15;
>> +	int oparg = (encoded_op << 8) >> 20;
>> +	int cmparg = (encoded_op << 20) >> 20;
> 
> Hmm.  oparg and cmparg look like they're doing these shifts to get sign
> extension of the 12-bit values by assuming that "int" is 32-bit -
> probably worth a comment, or for safety, they should be "s32" so it's
> not dependent on the bit-width of "int".

I thought Linux depended on the LP64 standard for all architectures?

Standard: http://www.unix.org/whitepapers/64bit.html
Rationale: http://www.unix.org/version2/whatsnew/lp64_wp.html

So int has a defined bit width (32) on linux?

Rob
