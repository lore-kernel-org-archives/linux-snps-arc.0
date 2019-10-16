Return-Path: <SRS0=haJm=YJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0565ECE588
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 08:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B63AF2168B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 08:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gkmkRtv8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B63AF2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4NGHbocvPmpnY89ECqf2o2EtAVzornpT/1Uokd/Auw=; b=gkmkRtv8VkXQ5z
	xLF7saBm+DQnpYJpkz6FsR7RqFel8lesY2sLFhK7NzoocHQgY0qasZcHd6PaGzkWrZRd+t9BUkGyU
	C9jy20riFqi1hzg0k6FCu8zwPHv2d6lvPOhKghkmCIa3vQzDmBKtzzhSAPuTkkVNeCAKFeXOHa12g
	3gL5jVZ5ncV02dKJvWM9MKQcm5fG84jIYHgqNG90aBkWJFe37vSdkx8+AXlEp3Nr1i77SUz0DPSB1
	Bqty2/9hBfaQyb33w7/hij+Rn7PhLVV7KpWhmFiDIBvY5IWhTaG2mHZw0rOLNWJ67Ov8OVydyaSA0
	gEz+RhS0fjSHcovvL2ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKeXs-0006z9-Fa; Wed, 16 Oct 2019 08:20:36 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKeXj-0006qg-0j; Wed, 16 Oct 2019 08:20:28 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8F4AEBA75;
 Wed, 16 Oct 2019 08:20:24 +0000 (UTC)
Date: Wed, 16 Oct 2019 10:20:22 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
Message-ID: <20191016082022.GN317@dhcp22.suse.cz>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571150502.5937.39.camel@lca.pw>
 <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_012027_352608_22C3B495 
X-CRM114-Status: GOOD (  13.54  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Qian Cai <cai@lca.pw>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue 15-10-19 20:51:11, Anshuman Khandual wrote:
> =

> =

> On 10/15/2019 08:11 PM, Qian Cai wrote:
> > The x86 will crash with linux-next during boot due to this series (v5) =
with the
> > config below plus CONFIG_DEBUG_VM_PGTABLE=3Dy. I am not sure if v6 woul=
d address
> > it.
> > =

> > https://raw.githubusercontent.com/cailca/linux-mm/master/x86.config
> > =

> > [=A0=A0=A033.862600][=A0=A0=A0=A0T1] page:ffffea0009000000 is uninitial=
ized and poisoned
> > [=A0=A0=A033.862608][=A0=A0=A0=A0T1] raw: ffffffffffffffff ffffffffffff=
ffff ffffffffffffffff
> > ffffff871140][=A0=A0=A0=A0T1]=A0=A0? _raw_spin_unlock_irq+0x27/0x40
> > [=A0=A0=A033.871140][=A0=A0=A0=A0T1]=A0=A0? rest_init+0x307/0x307
> > [=A0=A0=A033.871140][=A0=A0=A0=A0T1]=A0=A0kernel_init+0x11/0x139
> > [=A0=A0=A033.871140][=A0=A0=A0=A0T1]=A0=A0? rest_init+0x307/0x307
> > [=A0=A0=A033.871140][=A0=A0=A0=A0T1]=A0=A0ret_from_fork+0x27/0x50
> > [=A0=A0=A033.871140][=A0=A0=A0=A0T1] Modules linked in:
> > [=A0=A0=A033.871140][=A0=A0=A0=A0T1] ---[ end trace e99d392b0f7befbd ]-=
--
> > [=A0=A0=A033.871140][=A0=A0=A0=A0T1] RIP: 0010:alloc_gigantic_page_orde=
r+0x3fe/0x490
> =

> Hmm, with defconfig (DEBUG_VM=3Dy and DEBUG_VM_PGTABLE=3Dy) it does not c=
rash but
> with the config above, it does. Just wondering if it is possible that the=
se
> pages might not been initialized yet because DEFERRED_STRUCT_PAGE_INIT=3D=
y ?

Quite likely. You need to wait for page_alloc_init_late to finish.
> =

> [   13.898549][    T1] page:ffffea0005000000 is uninitialized and poisoned
> [   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff fffffffffff=
fffff ffffffffffffffff
> [   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff fffffffffff=
fffff ffffffffffffffff
> [   13.898549][    T1] page dumped because: VM_BUG_ON_PAGE(PagePoisoned(p=
))
> [   13.898549][    T1] ------------[ cut here ]------------
> [   13.898549][    T1] kernel BUG at ./include/linux/mm.h:1107!
> [   13.898549][    T1] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASA=
N PTI
> [   13.898549][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc=
3-next-20191015+ #

-- =

Michal Hocko
SUSE Labs

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
