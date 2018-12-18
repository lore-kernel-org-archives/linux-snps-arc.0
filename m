From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 15:11:12 -0800
Subject: [PATCH 01/21] longlong.h: sync from gcc to fix ARC inline asm
 constraints
In-Reply-To: <alpine.DEB.2.21.1812182254560.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-2-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182254560.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <66977e5e-8dea-c286-d60a-aba2a17977fc@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 2:56 PM, Joseph Myers wrote:
>>  	* sysdeps/unix/make-syscalls.sh: Fix comment referencing
>>  	syscall-template file.
>> +	* stdlib/longlong.h: Fix asm constraints for ARC code.
>
> I don't see the above context in the current checked-in ChangeLog file.  
> Patch 1 in a series should be creating a new ChangeLog entry in any case, 
> not adding to an existing one (and it's best not to include the ChangeLog 
> entry in the diffs, only adding it at the final commit time, to avoid 
> problems for people applying your patches).

Sorry my bad. I had one preceding patch in the pile which
  - created the Changlog entry
  - fixed a minor typo in make-syscalls.sh

I'll add that to v2.

Thx,
-Vineet
