Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FD5CD5BC7
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Sep 2024 13:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpHJLWlgYGEyZ7HrFouh49iCZrZ/j4GZuvPFxutkfKc=; b=IB2aZYqna+C+By
	YCwiS9TIkl5MN+1kBzuvQR0TVFnszWURSWx0m+tyxi/LJOhLiLV7ECKhkVOwgBVGWunRkFvGtPuqs
	0kE10Fz8d4Jm0IxJhC108wJj018T1eC2/sC+SzAa/aHyUWM5HMu5ymlMmnvEdVBvY3VKAknsC7BgC
	IGKRidKCsuL/H1LKd35dDxti2FdyehjHmotZ043OwpYDmphHLoUws6Y0dg3AP/OXcDHHMqsVq2mdI
	bm3ga4kl/mEyjPTDDUP2PSCE2pRTOIa3o7ZXDuHt84QG61tQhBP+xqWj95j+Pv8PBH6+oL3o9gWge
	TR5Yb806dDnxohPMKwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCmy-00000008Ztg-2BBu;
	Thu, 05 Sep 2024 13:44:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCml-00000008Zpe-0VpK
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Sep 2024 13:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09B09A44C26;
	Thu,  5 Sep 2024 13:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2709C4CEC3;
	Thu,  5 Sep 2024 13:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725543870;
	bh=b9acX5IhkohSbskqXXvGeItLmD2/cfBjvS2Wfhcu7XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIVMffKcqsMxDOvKmpQ/o52EIXtFaMD2p2GliETZD9N0Dk4ATVa7h8aY7R3arCYMp
	 6PEOjR1bq/MdcLyU9jcyTwzMWMRPlsX+J/UIMUYK7RKvPwFssxhdY4iVx2DY4c0Z7s
	 uue4s4wk1gtXDdxkJet5ojFq8gd9VObkCdj0dTyHH57NfvWZ5V2GcbYjNN4Zn+06uQ
	 EzMbC3xKlj7V45GE7t/TPviuOx7NkOFlIil6D3lPT+VE0ZjrR6uPchXtQ0cvPHDUyH
	 wdIw6zQPG6/KSBHdFcAAp18fvvQcsOIsAXX2GSUbcoLchhW8ng4EhXQUVAUZ21rsoH
	 CzGYdGtYtvYfQ==
Date: Thu, 5 Sep 2024 08:44:28 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 02/15] kbuild: split device tree build rules into
 scripts/Makefile.dtbs
Message-ID: <20240905134428.GA1517132-robh@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
 <20240904234803.698424-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904234803.698424-3-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_064431_247083_0F8B4EA4 
X-CRM114-Status: GOOD (  10.58  )
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

On Thu, Sep 05, 2024 at 08:47:38AM +0900, Masahiro Yamada wrote:
> scripts/Makefile.lib is included not only from scripts/Makefile.build
> but also from scripts/Makefile.{modfinal,package,vmlinux,vmlinux_o},
> where DT build rules are not required.
> 
> Split the DT build rules out to scripts/Makefile.dtbs, and include it
> only when necessary.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  drivers/of/fdt.c       |   2 +-
>  drivers/of/unittest.c  |   4 +-
>  scripts/Makefile.build |  25 +++-----
>  scripts/Makefile.dtbs  | 142 +++++++++++++++++++++++++++++++++++++++++
>  scripts/Makefile.lib   | 115 ---------------------------------
>  5 files changed, 153 insertions(+), 135 deletions(-)
>  create mode 100644 scripts/Makefile.dtbs

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
