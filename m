Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA5EC4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Dec 2022 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAZhxJPJk+7v3cTf6hJkoSK3nw/x73cJkQYe3gM4d/Y=; b=nXux2OFWr1dBae
	sVu2FhGvqyk4h6Xdyr9z3QR/UqdoMiOUTH3Io4s4GNjiOpaieUkn0myjvaTPD2ZiDrg/6kLa6AT32
	Nc5nXYhsRPj3aVGKG6k6bP3DfZ2Nag+A7KmL+xGhl/eThnBBLlzdpiHdHCh1gVV86Mk4/bqqkMDHc
	QegFq1Jyfwlkfi3NrMcgrCh9VMef8+qfWMmKI5HVKoHamJxbzqIxF/wYggyLjwOW/W4fEi2l/a5sS
	p1g4taYhnRPllie/BsVgmv5nQRxnModrtBAlZjouQrRJ/Qhl+jjoQ4XTKgTXQyydKdTnVC2n6S2nr
	ie0nxLyl1gx80ihE5Qiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApJC-00EEkG-4S; Thu, 29 Dec 2022 09:34:42 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApHF-00EDWm-Bu; Thu, 29 Dec 2022 09:32:43 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A20595C022E;
	Thu, 29 Dec 2022 04:32:40 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 29 Dec 2022 04:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1672306360; x=1672392760; bh=dQitIKz9Zv
	Mk4oytHD9JLdnkBzb2SNyrpGTj/IDH57g=; b=V/5Cv1VhfpH5iTFAIPNbee37+7
	fGRfQGhS2cfvaoU5prjYmzEkJOixzWrHBayYA/LAbI8aGtT5NUL+owTmoaFj3n3B
	LJoHwRocbJtfuMEyHSx/wyanvvQ13DDzevGclpYyw7qeYNEVViTXINcAj0D9vgsh
	7pfvXG5yZXolmbAG1xnYy8Ot//4tvH7LNGG1PIQsV13T27gAt8TnwFw1loQa0vbD
	oPcv9yAU1hrNnDzJ4hHBOxfksO9Tu+rLYKEWw8IH2L2YS5xRATHewhb6Zy3ABb5W
	Th9HksHzXkv0qeIqDaZbZW8EtN2KMBSeSVjD4popm9MiVXhAr8il3YStrrLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672306360; x=1672392760; bh=dQitIKz9ZvMk4oytHD9JLdnkBzb2
	SNyrpGTj/IDH57g=; b=iDQJHK36vHwWh1wRKl4E4QER7+DQKeClUsyglmglgxkg
	EljL62jR2iZg18aei0CuCeH832VH529cwGFTM79QLvISe5DOGQCCaE9a5nVoNcdT
	vRyncomABgBeJ3SsaAqCusYLubSRqSwkWTAzvRqkgUp7P/uDuSrSC8oJAPjjHwnG
	Zd0Dd9LmkVGzRX1+/eSzkb96N8eNNz/u/R6Fm30nUUZjYR3EyVzLMio8jHJyXxIj
	iQzshYRj6uSLjiurv3YD4ZUHN8c2WtRhXRw4+fHy6C13RBukmzzaZvqF15WJiEkO
	SQyTebTGPXArLBywDKO2H+WZBi9s4A/HPkn50Hzk8Q==
X-ME-Sender: <xms:t16tY_xTXyOBxZzRlwIxGAjI2ettOKadK7A9iMGmJP2qRljOTcBayg>
    <xme:t16tY3RGUfHsWbJR8Ja2QCw0SFyKp0uowcI1CysTjogMdtCluR5C8uHqieGWGVAVH
    SG9ndtEeyJsrl3xTZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:t16tY5WPN0eRhQuqkXR1eQBdMOuAo-5nAJJ36hmRXP0lPVn6iv5ojg>
    <xmx:t16tY5hs5xXyUOxLtmXCD1t9iRdCyPGN1E3t5Pc7uUgssA87nClWZw>
    <xmx:t16tYxCRfWeK3MQh1NvH9n9BHNHyKE86lXXcTf6N2kZ0kJveeEq2-A>
    <xmx:uF6tY2yAnrmYZFHKR9Art5c4-CoKhKbO440aSm6r1v3bh4Mq4Q8mmQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AA077B60086; Thu, 29 Dec 2022 04:32:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <78b23407-bdd0-4b1b-bf6e-ecd4c00294ab@app.fastmail.com>
In-Reply-To: <20221222114635.1251934-3-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <20221222114635.1251934-3-andrzej.hajda@intel.com>
Date: Thu, 29 Dec 2022 10:32:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Peter Zijlstra" <peterz@infradead.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Mark Rutland" <mark.rutland@arm.com>
Subject: Re: [PATCH 02/19] arch/arc: rename internal name __xchg to __arch_xchg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_013242_317109_1B579071 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

On Thu, Dec 22, 2022, at 12:46, Andrzej Hajda wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  arch/arc/include/asm/cmpxchg.h | 4 ++--

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

for all the arch/*/include/asm/cmpxchg.h changes.

Since these patches are all the same, and they have identical
subject and description texts, I would suggest combining them
into a single patch to keep the series more compact.

Having them separate would allow merging the patches through
the individual architecture maintainer trees, but that in turn
would mean waiting longer to get it all merged, but in this
case it seems way easier to go through the asm-generic
tree.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
