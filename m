From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 16:52:28 -0800
Subject: [PATCH 04/21] ARC: startup and dynamic linking code
In-Reply-To: <alpine.DEB.2.21.1812182323370.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182323370.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cfb1404b-b639-f9d4-43d6-9ab7cc63fb73@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 3:24 PM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> +/*
>> + * Dynamic Linking ABI for ARCv2 ISA
>> + *
> glibc does not use leading '*' on each line of a comment (needs fixing 
> throughout this file).

OK !
