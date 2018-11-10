From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Sat, 10 Nov 2018 00:06:39 +0000
Subject: [PATCH 06/13 v3] arc: define syscall_get_arch()
References: <20181109031605.GF21511@altlinux.org>
 <e729da9ed78b6b62463a27d3012ac63c7b66be08.camel@synopsys.com>
 <CALCETrUzfOcLYDUW6s1Ra2xduDCQSbscKBw=vApCP2HNmfDmMw@mail.gmail.com>
 <456a69c6e01a6ab5b1af6d459a249388f8b4c1f5.camel@synopsys.com>
 <C6CF3942-3307-431F-B76C-B550BB48F472@amacapital.net>
 <215d66fd9a197b631973c9ff75943b4c1216b899.camel@synopsys.com>
 <CALCETrXCcBBTzcL_yz3agNhby1huZSn2UGtJ9Soo=8n8_rj1Tg@mail.gmail.com>
 <20181109233342.GC2710@altlinux.org>
 <C2D7FE5348E1B147BCA15975FBA23075013A59253C@us01wembx1.internal.synopsys.com>
 <20181109235426.GD2710@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075013A592577@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/9/18 3:54 PM, Dmitry V. Levin wrote:
> syscall_get_arch() is required to be implemented on all architectures
> that use tracehook_report_syscall_entry() in order to extend
> the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
>
> Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>

Acked-by: Vineet Gupta <vgupta at synopsys.com>
