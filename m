Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FF8C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Dec 2021 03:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRPQ+CqUN464X6jWxhF6E9rtbWoqmsn4ahKyHE9xm3g=; b=TEmuCMZM/+uAT0Xxsp8/PBjXJO
	ic5OeFhJVGaZoXcUF+IjHRcE9rx7RSl2zPkLw/f2FXxZy1HB25pxy9XM400779AdAZHOuYBiY31gC
	i+RgKxw2c9bueZkA2GpXksEET/+123MKBP9BLPFCWrc6aL1sV7K7B9tO5KG5BvFXvyt8hhg+zso05
	yG/Wtp76tdAneyyNDOidLncO83ERCTlUjcrcY0vfiwvEZ2eHROkqJfEPETLZFhiiUpcJzhKhErvI7
	RQ1FhxBj9AOX5igjeeC0oHTVOQuINo8qz30onSqf3o8M48j8oCiaRRQxY8SO6AG2THjJEIXgdRax4
	pH3GlyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Pyi-002DIB-BI; Wed, 29 Dec 2021 03:50:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Pyf-002DHU-M3
 for linux-snps-arc@lists.infradead.org; Wed, 29 Dec 2021 03:50:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63ACEB81806;
 Wed, 29 Dec 2021 03:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BC0C36AE7;
 Wed, 29 Dec 2021 03:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640749811;
 bh=+dovNCfwC0M66Z/pqYa48ziKN3W6MFbpECtO162+6d8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MXtiE8r8nWpwbnD3VkdthoM+kkXPzxEfQ2flz0GnLla//ztBJdizYXllfGBhx9Glt
 B+K+ITD6TUQhizYRo+jUPjk5etjwXNx4Nc/Aan8dXPV89KNdHKf+xPEeD3co1PW0Zf
 j2/YNLJQjdGLH57ONjomhOn9V+9Qroxg0t6aGhpicBW/oHp4nq01gsyC4hw70Jv3hR
 A+R4fy/YjQi6tE7JIggyMZHv4gdKBBMOtC/iOxIRh+y7d0XrXVBLJg+b7pgSUmSctj
 nlHM2pfZCsBT+4pHBMTx3lNFJCy+dcVsZ1ZzvYD2yWpeDpRH47rfWCsGd9RoxfSbOu
 g1vz9JltqXTeg==
Subject: Re: [PATCH] arc: use swap() to make code cleaner
To: Yihao Han <hanyihao@vivo.com>, Vineet Gupta <vgupta@kernel.org>,
 Jinchao Wang <wjc@cdjrlc.com>, "dean.yang_cp" <yangdianqing@yulong.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@vivo.com
References: <20211110030715.21681-1-hanyihao@vivo.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <e7d81e8e-bdf0-1b14-db53-c82a516c913a@kernel.org>
Date: Tue, 28 Dec 2021 19:50:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211110030715.21681-1-hanyihao@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_195013_896280_D9792C99 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/9/21 7:07 PM, Yihao Han wrote:
> Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
> opencoding it.
> 
> Signed-off-by: Yihao Han<hanyihao@vivo.com>

Added to ARC tree.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
