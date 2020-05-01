Return-Path: <SRS0=ERPa=6P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA275C28CBC
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 May 2020 02:29:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B132073E
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 May 2020 02:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C1rPA+9w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="C40FoaSb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B132073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzXASJvHuXlSgtTJX63HcfDhaFFWzCvSLclf+NmGi18=; b=C1rPA+9w98ekz9
	tR7y5HQyrKLtGSdpG3OCJUQSCCD/Wjx7azRYP5R6zfzMloBKukekMAGdUsh0hOd+izLLzm01/RIuS
	oAYyDrdC0DX+76uhtukFHqXP3lyKe3FMSbg3B6Klsc9vINIF9+eRcMPMexKLqtBCXsd7yzUmIXhds
	8EGph+UXoEXAZTTpDpD1OG0jtIsBgB31uzpLH5KFoQoz6WB6+o91ndH7rWbD/Gl+zbJ5RLgiMET6T
	4UWU2+hv3f6OHw41b4jGtizsfrPL1uUHWOmWCj7qeJWRzXqimT1/m23S8U9j40EoiAej/Fdy9vwbp
	CgKiut7TQihxPoM3VG1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jULQM-000541-Br; Fri, 01 May 2020 02:29:10 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jULQB-0004uT-3H; Fri, 01 May 2020 02:29:00 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Cx5B5W4lz9sTP;
 Fri,  1 May 2020 12:28:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588300133;
 bh=+bqrLgcGFCf99Uu0U3dlp7gViTjK7ah+NjB2S1m2Aik=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=C40FoaSbb6Q7wxAomTtdxarjIzmNFst3ymTI/G0w+2Kk4NeklpK6MsprW4aeFuOL/
 TkwCTTk/7ic3XMxxS6CK/X3oa/bQeVyESN7G+SaFXOX7im9fHNKTrHsMKV+kWikDkZ
 F4EQg/axXQnDydjHMY8YK4m1w7/g6KQLwOau55AA3fV9h56VfUn56xpldCbghHJ2Ak
 2N9znvLw+oscvvZuzcfTam9qWHZe31okh0MKjz+kAwW42XWB85OVqyucfXymD7ELvU
 m5F7EwikPo5WIhIxh6Mz3Olzdcc/jvC1qxexqP0q2olewhZMqGmdXIZmIE3aXRiBqJ
 5a8C0skKdBJKw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: ira.weiny@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH V1 00/10] Remove duplicated kmap code
In-Reply-To: <20200430203845.582900-1-ira.weiny@intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
Date: Fri, 01 May 2020 12:29:00 +1000
Message-ID: <87imhge6c3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_192859_300130_01D47A80 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ira.weiny@intel.com writes:
> From: Ira Weiny <ira.weiny@intel.com>
>
> The kmap infrastructure has been copied almost verbatim to every architecture.
> This series consolidates obvious duplicated code by defining core functions
> which call into the architectures only when needed.
>
> Some of the k[un]map_atomic() implementations have some similarities but the
> similarities were not sufficient to warrant further changes.
>
> In addition we remove a duplicate implementation of kmap() in DRM.
>
> Testing was done by 0day to cover all the architectures I can't readily
> build/test.

I threw some powerpc builds at it and they all passed, so LGTM.

cheers

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
