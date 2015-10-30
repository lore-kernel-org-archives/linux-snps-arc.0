From: mans@mansr.com (=?iso-8859-1?Q?M=E5ns_Rullg=E5rd?=)
Date: Fri, 30 Oct 2015 12:41:33 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44CE63A@IN01WEMBXA.internal.synopsys.com>
 (Vineet Gupta's message of "Fri, 30 Oct 2015 05:41:46 +0000")
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
 <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
 <C2D7FE5348E1B147BCA15975FBA23075F44CE63A@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <yw1x611ocyv6.fsf@unicorn.mansr.com>
To: linux-snps-arc@lists.infradead.org

Vineet Gupta <Vineet.Gupta1 at synopsys.com> writes:

> Claudiu, can some of this not be done in gcc itself !

All of it could be done by gcc.  The trouble is that it isn't.

-- 
M?ns Rullg?rd
mans at mansr.com
