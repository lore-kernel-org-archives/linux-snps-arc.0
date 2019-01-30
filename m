From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 30 Jan 2019 21:19:52 +0000
Subject: [PATCH v2 00/15] glibc port to ARC processors
In-Reply-To: <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
 <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1901302110560.16754@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, 30 Jan 2019, Vineet Gupta wrote:

> Having said that, wheels were already set in motion after your initial request in
> December. The ARCv2 ABI spec was opened up quickly (and mea culpa for not
> referencing it v2 submission). It is now publicly accessibly at [1]

Thanks.  To be clear, the description at 
<https://sourceware.org/glibc/wiki/NewPorts> of what should go in the 
summary message for a new port submission should be considered to apply to 
every version of that submission, so that each submission is 
self-contained.  That is, every version of the submission should include 
information such as pointers to relevant manuals (in addition to 
whatever's appropriate about changes from the previous version of the 
submission).

> The public version of PRM is being worked on, but it will take time to 
> come to fruition. I hope you appreciate these things take time, 
> considering where we came from - and it seems you found a workaround 
> anyways ;-)

There are five months until the freeze for 2.30 starts (obviously the port 
will need its symbol versions updated for 2.30).

-- 
Joseph S. Myers
joseph at codesourcery.com
