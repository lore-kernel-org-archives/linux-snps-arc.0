Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D202AC3DA4B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jul 2024 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoo6Ue/jG8tXD7e81OYSUcaCWUpD3t0dYYOVzhSb75c=; b=OodS0LkoypO0L+
	IvnOTumRjnxi4D5qzzMm7koze++tuOwNv74ruo4K/2bM3l2W5vCGWfynxzJk7dVvyFsrgdRNHSYGp
	LvKdat+85P/0+fpkoDIU+RDFYoxRFsgUet7A4MFa1t8UV5uX/LxQ/SyJd3AhHid0U2Pr5eebaFMKd
	nrnuTPdUgUVFPjxMDY0NqKH8BfwWWrmZFd0rPO7MKBYZMZ1oqyaP9BmAWkzFKnJ5knnK0aQacciSD
	P3PScODXHoVG6wsVCG4VZKNMs0WxPlSFrMBqNnywI/lOzHSQRBZJzjluKuzawlgapKpt0kYV13BIn
	gibL5ZykaZxHm5fMPjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTyM0-0000000CsXY-1fia;
	Wed, 17 Jul 2024 06:41:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTyLe-0000000CsTQ-3qAV;
	Wed, 17 Jul 2024 06:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C09561458;
	Wed, 17 Jul 2024 06:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC76C32782;
	Wed, 17 Jul 2024 06:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721198469;
	bh=TtuRc2bthK6fRDYeDiyYE7I8wA3/LSlbRqB8Z94EXF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Da/UtMXGLGpAloHTui+wRHmRa78G93Ysni0bH8ZiPhLaF6kWU0JSEq+A9KYhAlkSm
	 ay/J1K12NOBeucVPz1UeX0cGVegg4/ClxbTZlTHn8aiH61taFZdKtn05BVx3IxyFoN
	 po3XrI6w8bbNrUeQOjXqm/3+LoERkZVFY9JySkoiH+ovrtZR+hR7bofeYRua4D+uf7
	 LGKw4RPHd/lK0T2bIaHI2D4PpiB9xnhx/Zg8NfSIDBQqpl8uoiq02K3RXOFKK1P87U
	 NXBfXvi4t6rFBfv4Nl3xt6nakUoMQ9gYMQfiBbTnqn1S4zvbiP3jpkgj1znAR/lKm9
	 aiX7hAlo2IDBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sTyLe-000000005p8-1glo;
	Wed, 17 Jul 2024 08:41:10 +0200
Date: Wed, 17 Jul 2024 08:41:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [GIT PULL] asm-generic updates for 6.11
Message-ID: <ZpdnhhaQum_epcGp@hovoldconsulting.com>
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
 <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
 <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
 <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
 <2b6336d1-34e0-48dd-b901-7b5208045597@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b6336d1-34e0-48dd-b901-7b5208045597@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_234111_027421_F3D3EB81 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jul 17, 2024 at 08:01:43AM +0200, Arnd Bergmann wrote:
> On Wed, Jul 17, 2024, at 07:08, Linus Torvalds wrote:
> > On Tue, 16 Jul 2024 at 21:57, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> >>
> >> Note, it really might be just 'allmodconfig'. We've had things that
> >> depend on config entries in the past, eg the whole
> >> CONFIG_HEADERS_INSTALL etc could affect things.
> 
> I had tried a partial allmodconfig build earlier to save time,
> did a full build again now, still nothing:

FWIW, I noticed this last Friday as well when I did a few builds of
linux-next and every change I made triggered what appeared to be a full
rebuild of the tree.

This was with a trimmed config [1] and separate build tree (tmpfs).

Johan


[1] https://github.com/jhovold/linux/commit/c3324059a67c7c63186107771eabc17a66772989

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
