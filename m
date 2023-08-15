Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6477C001B0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=In8/PVmS56wngv9RZqe944eJUxo9k5OaZpX7QbuX2V8=; b=kuGX0h9l1ZdNRM
	epwzhPXSR2Lc0igyrwKguOlNRBUH/fILanF/yUc3b4DINZ1oCdkQQkwF8HJrIPBiSxKVfxRxWCN5U
	nPUEdWzjhXvUel7EDgqMqDxmKUjPDtflbQcufgrqUKmfSTo7cw9uBTTnwDn51qs28e4335O1Onm64
	utQvcx2zMNPCAOJeajd8YRDrLlVNF354FA41RNAe0JhX+G8iEb5mC2JZ9JBTikSBIkxnwnSG8TB6U
	Ob+xkNYvM9ZbsybF68F4cIlxrNg/uD2rg6o4SvlvV56K1gcEE9ghO2HRFxpagXEm2ZtiXUOzcZz+s
	Lh2fW27Tl6srdYgf6jjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVx0x-001zRG-32;
	Tue, 15 Aug 2023 16:35:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVx0u-001zQX-28
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 16:35:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1FD862E74;
	Tue, 15 Aug 2023 16:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C819C433C7;
	Tue, 15 Aug 2023 16:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692117323;
	bh=WAfPmP4DH1mwde7Ao/JTrW1ILoChZSppc9ArGa2ECe8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=TdJPB2wOSm09Oktdk0iQI4l1bd5K+tTwtmzKQWTVRl842KYqdNYAdeyC55zcdKE4/
	 bYqbG9yhmMOYqgK434oVCXpSJUhijLOD/NzQ17r7rD9QHTApYOT9a+XaFt20W5sdls
	 RlbQdK9bYWwPCbVenXWEZQv+eYTK9ewAnkklIyE2mBxuH+tNGbtZNMCqdllm/AdA8N
	 JPk5BMGGx2GaWJISPg0wSUcv7ez0Jh8UEBAITj6CIG4Y02kKhdT8jzkfYI/tYyfxfU
	 8DqLgXooKyjvUWFgeyC8mn+g/giaWM3ZFraeAcKZtSCwpJmOJsuUg2RNyjNBtJTU6f
	 q6BJCz/BBOuxA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CB0F9CE09C4; Tue, 15 Aug 2023 09:35:22 -0700 (PDT)
Date: Tue, 15 Aug 2023 09:35:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	lkp <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: {standard input}:1727: Error: operand out of range (-132 is not
 between -128 and 127)
Message-ID: <574cfd03-c279-4cf7-872f-cbe0b8788a50@paulmck-laptop>
References: <202308111233.rbf5C0JD-lkp@intel.com>
 <416679c9-96b3-4114-bba3-473e647c4c2d@paulmck-laptop>
 <f90742a02398f03f715b2a9afef213f5dee8f2bf.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f90742a02398f03f715b2a9afef213f5dee8f2bf.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_093524_790538_7F238210 
X-CRM114-Status: GOOD (  28.43  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Aug 15, 2023 at 07:34:04AM +0000, Liu, Yujie wrote:
> Hi Paul,
> =

> On Fri, 2023-08-11 at 08:41 -0700, Paul E. McKenney wrote:
> > On Fri, Aug 11, 2023 at 01:02:12PM +0800, kernel test robot wrote:
> > > tree:=A0=A0 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git=A0master
> > > head:=A0=A0 25aa0bebba72b318e71fe205bfd1236550cc9534
> > > commit: a6889becb05394255c80b62103677e3b095726a9 refscale: Add tests =
using SLAB_TYPESAFE_BY_RCU
> > > date:=A0=A0 7 months ago
> > > config: arc-randconfig-r006-20230811 (https://download.01.org/0day-ci=
/archive/20230811/202308111233.rbf5C0JD-lkp@intel.com/config)
> > > compiler: arceb-elf-gcc (GCC) 12.3.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20230811/20230811=
1233.rbf5C0JD-lkp@intel.com/reproduce)
> > > =

> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202308111233.rbf5C0JD=
-lkp@intel.com/
> > > =

> > > All errors (new ones prefixed by >>):
> > > =

> > > =A0=A0 {standard input}: Assembler messages:
> > > > > {standard input}:1727: Error: operand out of range (-132 is not b=
etween -128 and 127)
> > =

> > I am not seeing any inline assembly in that patch, so I have to suspect
> > a bug in arch code or the compiler backend for arc.
> > =

> > Or is there something that I am missing here?
> =

> We looked into this case a little bit. The assembler error popped up
> when building kernel/rcu/refscale.o
> =

> $make W=3D1 --keep-going CROSS_COMPILE=3Darceb-elf- ARCH=3Darc kernel/rcu=
/refscale.o
> ...
>   CC [M]  kernel/rcu/refscale.o
> {standard input}: Assembler messages:
> {standard input}:1727: Error: operand out of range (-132 is not between -=
128 and 127)
> make[3]: *** [scripts/Makefile.build:252: kernel/rcu/refscale.o] Error 1
> make[2]: *** [scripts/Makefile.build:504: kernel/rcu] Error 2
> make[2]: Target 'kernel/rcu/refscale.o' not remade because of errors.
> make[1]: *** [scripts/Makefile.build:504: kernel] Error 2
> make[1]: Target 'kernel/rcu/refscale.o' not remade because of errors.
> make: *** [Makefile:2008: .] Error 2
> make: Target 'kernel/rcu/refscale.o' not remade because of errors.
> =

> We did some assembly and disassembly tricks:
> =

> 1721 .L334:
> 1722         ld_s    r0,[r14,52]             ;15
> 1723         brgt r0, r19, @.L335
> 1724         ld_s    r0,[r13,120]            ;15
> 1725         breq_s r0, 0, @.L337
> 1726         jl [r17]
> 1727         brne_s r0, 0, @.L337    <---
> 1728         mov_s   r2,20   ;3
> 1729         mov_s   r1,0    ;3
> 1730         mov_s   r0,sp   ;4
> 1731         jl [r20]
> 1732         mov_s   r1,0    ;3
> 1733         mov_s   r0,sp   ;4
> 1734         jl @init_wait_entry
> 1735         .align 2
> =

> This assembly instruction at line 1727 points to the code in main_func,
> but main_func is not touched by commit a6889becb053.
> =

>  d6e:   860d                    ld_s    r0,[r14,0x34]
>  d70:   0b59 a002               brlt.nt r19,r0,-168     ;cc8 <main_func+0=
x16c>
>         return arch_atomic_read(v);
>  d74:   851e                    ld_s    r0,[r13,0x78]
>                 wait_event(main_wq,
>  d76:   e842                    breq_s  r0,0,-124       ;cf8 <main_func+0=
x19c>
>  d78:   2022 0440               jl      [r17]
>  d7c:   e8be                    brne_s  r0,0,124        ;df8 <main_func+0=
x29c>   <--
>  d7e:   da14                    mov_s   r2,0x14
>  d80:   702c                    mov_s   r1,0
>  d82:   4083                    mov_s   r0,sp
>  d84:   2022 0500               jl      [r20]
>  d88:   702c                    mov_s   r1,0
>  d8a:   4083                    mov_s   r0,sp
>  d8c:   2022 0f80 0000 0000     jl      0
> =

> We also tried on the parent commit 3c6496c86e48. It builds fine without
> that assembler error, and corresponding disassembly is:
> =

>  afe:   860d                    ld_s    r0,[r14,0x34]
>  b00:   0b5d a002               brlt.nt r19,r0,-164     ;a5c <main_func+0=
x16c>
>         return arch_atomic_read(v);
>  b04:   8518                    ld_s    r0,[r13,0x60]
>                 wait_event(main_wq,
>  b06:   e844                    breq_s  r0,0,-120       ;a8c <main_func+0=
x19c>
>  b08:   2022 0440               jl      [r17]
>  b0c:   e8c0                    brne_s  r0,0,-128       ;a8c <main_func+0=
x19c>   <--
>  b0e:   da14                    mov_s   r2,0x14
>  b10:   702c                    mov_s   r1,0
>  b12:   4083                    mov_s   r0,sp
>  b14:   2022 0500               jl      [r20]
>  b18:   702c                    mov_s   r1,0
>  b1a:   4083                    mov_s   r0,sp
>  b1c:   2022 0f80 0000 0000     jl      0
>  b24:   724c                    mov_s   r2,2
>  b26:   4183                    mov_s   r1,sp
>  b28:   40c3 0000 0000          mov_s   r0,0
>  b2e:   2022 0f80 0000 0000     jl      0
> =

> =

> We are also not sure if this is a bug in arch code or compiler side.
> Here we provide above info for your reference.

Thank you for looking into this and getting back to me.

I added the ARC maintainer and list on CC.

							Thanx, Paul

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
