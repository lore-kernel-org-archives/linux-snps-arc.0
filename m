From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 29 Jun 2017 18:22:40 +0300
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5a738e1a-fac6-3dbb-3c3f-744b12966dd7@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/27/2017 02:56 PM, Joseph Myers wrote:
>> diff --git a/sysdeps/unix/sysv/linux/arc/ld.abilist b/sysdeps/unix/sysv/linux/arc/ld.abilist
>> new file mode 100644
>> index 000000000000..6001f2e98402
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/ld.abilist
>> @@ -0,0 +1,12 @@
>> +GLIBC_2.24
>> + GLIBC_2.24 A
>> + __libc_memalign F
>> + __libc_stack_end D 0x4
>> + __stack_chk_guard D 0x4
>> + __tls_get_addr F
>> + _dl_mcount F
>> + _r_debug D 0x14
>> + calloc F
>> + free F
>> + malloc F
>> + realloc F
> These ABI lists are in the old format.  You need to regenerate them anyway
> for the increased minimum symbol version.
> 

I regenerated the ABI files, but it seems generated  libc abilist is lacking 
malloc_{get,set}_stated and had to be added manually - which causes a subsequent 
testsuite failure. Is this (manual addition of entries to abi file) correct or is 
this a deficiency of ARC port.

Speaking of testsuite, since this is bootstrapping a glibc system we have to 
resort to using scripts/cross-test-ssh.sh which is a serious pain in the neck. Is 
there no easy way to build the whole test suite first and then just run it on target.

-Vineet
