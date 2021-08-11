Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC3CC4320E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 18:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 375BC610CC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 18:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 375BC610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5CCHNioUqQ2/kC89DPVNzFUmkoNppLLC3uNtao3TFs=; b=Dcd+k5rUnPzKp/T4qGVD5GnjHr
	iEXjj5IjrAayJLD6O3Ht/lTgwoj2aAzYzHrN2RU3Q6K3370qA6+j3FqWwA6fTAufMPhuBbvMxTp5D
	yjs6MkS7bE5YM439VED5ZAlmEUvERvHV7o/RgA7x/Kc1gKiJXOm/ahUAvMPu1RBj76Tg9EHSOOd8T
	Zi8lTDSO4irXU4d2WjoQtu7v1eXoozpgVcbq0V9CvgSRICqX7D7ePzAGP4sPE+YNgcTpYFFNRYFba
	bI0/GycvZgGdsEUONkcld4Jzl2DXvnycX++0RYv7gzoH4eKYsxD5KMs5j9t6057zMVnSuxBW41PU8
	SogSfTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDtQt-007wUs-K5; Wed, 11 Aug 2021 18:58:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDtQq-007wU3-Q7
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 18:58:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FFD2610A3;
 Wed, 11 Aug 2021 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628708308;
 bh=vdYvbtM2dGDht3rO6eGEM9yfvtq8RxVaXP3rzYQ5CAE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tWOYCgNyiMgVvgDnqmyQVIkWrT076yCF7mKr6+NmLhiVG43Dnsi9g74L87u7y1fEs
 RhMCt+eiqL/Q+hcDxSs/DqxTVtRhEv1ZF9rsdMF1E5p3trb2NjTL1DnWUUKtnRiJsS
 UzplKrOEmK/hZXCONNGHE18LbpQ1eqoWyfvX2O82vIHf/hC5nS6VvvIzRPM+7VIVlW
 fomcZ9armD8piHy67WrDgxSdVBUIh7btTtUjOAA9NrYZE7E4bVpksaL0H1w6KXZGHw
 Wei0Vx3tNvZO0HqS5C/TpwAQ35YNv1WNCCpf8mzHLQ7IE1Qp/LflzX6bYy4MY+0Hzv
 50hGcJIgaSOjQ==
Subject: Re: [PATCH 07/18] ARC: ioremap: use more commonly used PAGE_KERNEL
 based uncached flag
To: Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-8-vgupta@kernel.org> <YRNdiDnMjQ2hKzIV@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <07c12487-dc65-9d2a-71a5-65b47c98a460@kernel.org>
Date: Wed, 11 Aug 2021 11:58:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRNdiDnMjQ2hKzIV@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_115828_900972_64F9A662 
X-CRM114-Status: UNSURE (   6.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gOC8xMC8yMSAxMDoxOCBQTSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPj4gLQlyZXR1cm4gaW9y
ZW1hcF9wcm90KHBhZGRyLCBzaXplLCBwZ3Byb3RfdmFsKFBBR0VfS0VSTkVMX05PX0NBQ0hFKSk7
Cj4+ICsJcmV0dXJuIGlvcmVtYXBfcHJvdChwYWRkciwgc2l6ZSwKPj4gKwkJCSAgICBwZ3Byb3Rf
dmFsKHBncHJvdF9ub25jYWNoZWQoUEFHRV9LRVJORUwpKSk7Cj4gQnV0IHRoaXMgYmVjb21lcyBf
UEFHRV9DQUNIRUFCTEUgbm93LiBXaGF0IGRpZCBJIG1pc3M/CgpXZSBub3cgdXNlIHBncHJvdF9u
b25jYWNoZWQoKQoKYXJjaC9hcmMvaW5jbHVkZS9hc20vcGd0YWJsZS5oOjMwOiNkZWZpbmUgcGdw
cm90X25vbmNhY2hlZChwcm90KcKgwqDCoMKgwqDCoMKgIAooX19wZ3Byb3QocGdwcm90X3ZhbChw
cm90KSAmIH5fUEFHRV9DQUNIRUFCTEUpKQoKLVZpbmVldAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
