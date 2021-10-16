Return-Path: <SRS0=k1DJ=PE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B47C433FE
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Oct 2021 01:17:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF65560F93
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Oct 2021 01:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF65560F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NDqfbip+CvC3kXm/JyU/cOz/0qgP/ZvzTRvzsSWaSvc=; b=PNgtnVVGDTMyUDt66h9Q+GOvXz
	CxLGsZrXtwhrbuB04LTt7EAM2WQEZDofmmhZeBCtJt9CrhWXev8v9Kqe7NM71fxo1xGI6fT7MS/CU
	sb8soxcbWHfPAb5K+3cGsgPqJGBRxIt222rB25nFUII3gEyxFbK0bvj9/z1176tONT/PtuwIB5gnJ
	FRT1Sv9Zuz0/IcqFM89/vJAO8FbDsoNz88s1yW0QpUB92r0Bklr6nc8aBGggSHfE+m0SoI/ob7sv3
	uZ4IvGyALrhsqqoIJdtbPzo/hwGjC6dbVkcJaf7tQzfP93hhY/fvevE+C0O4up2yrDiUdhuLI99eu
	WJ8p/Nyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbYKU-009RpM-2m; Sat, 16 Oct 2021 01:17:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbYKS-009Rp4-7P
 for linux-snps-arc@lists.infradead.org; Sat, 16 Oct 2021 01:17:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2735D60FDA;
 Sat, 16 Oct 2021 01:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634347059;
 bh=/MNVPMeFHYltqD3R3YXzREiAEwC54RXmWzNJrWqFQh8=;
 h=To:Cc:From:Subject:Date:From;
 b=jOw7bSAAiHwir5uTg7LQxYyI7NK9SnhRQc+3+OPXz790kgfjztaNmdPlLylvw8Mxf
 Hnv7SQgyeQ5RFX2fDsMNXQRKZPxFTMMn39+xOyPgXmwjOqou2VkTslXgCnPdLEAa1K
 KU7vO2h+gtt7UJzDM6P0Jav7PAn6F6mvNxiO4ykgLyxIqpbr6GU0vgyuLfJDVXE5Np
 i+BNtPn9CQyxWkWBLB3zoUC5LnB9lO2SYRktq7oQUe9B1MJvzDE84r5wquKE5paeS1
 QHRzCG9jp1BnzgfPnTgaG4l6kCHnWezeHlDQq81MT2s1kOGhcubY7zJuiKolzPTbIC
 b0RDh5mxZG9Eg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>
From: Vineet Gupta <vgupta@kernel.org>
Subject: [GIT PULL] ARC fix for 5.15-rc6
Message-ID: <8dd82653-d44e-7470-6490-bc486c09590b@kernel.org>
Date: Fri, 15 Oct 2021 18:17:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_181740_333929_23AF6CFE 
X-CRM114-Status: UNSURE (   6.26  )
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

SGkgTGludXMsCgpGaXhsZXQgZm9yIEFSQywgYmV0dGVyIHRvIGdvIGluIG5vdy4gUGxlYXNlIHB1
bGwgIQoKVGh4LAotVmluZWV0Ci0tLS0tLS0tLS0tLS0tLS0tLS0+ClRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgNjQ1NzBmYmMxNGY4ZDdjYjNmZTM5OTVmMjBlMjZiYzI1Y2U0YjJj
YzoKCiDCoCBMaW51eCA1LjE1LXJjNSAoMjAyMS0xMC0xMCAxNzowMTo1OSAtMDcwMCkKCmFyZSBh
dmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKIMKgIGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92Z3VwdGEvYXJjLmdpdC8gCnRhZ3MvYXJjLTUu
MTUtcmM2Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYzNjYTMxY2UwZWExZTFhZTM0
NzQ4ZGVkNTRiNmNjYzMxOWU3ZWQyMDoKCiDCoCBBUkM6IGZpeCBwb3RlbnRpYWwgYnVpbGQgc25h
ZnUgKDIwMjEtMTAtMTUgMTg6MDY6MzIgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClNtYWxsIGZpeGxldCBmb3Ig
QVJDCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tClZpbmVldCBHdXB0YSAoMSk6CiDCoMKgwqDCoMKgIEFSQzogZml4IHBvdGVu
dGlhbCBidWlsZCBzbmFmdQoKIMKgYXJjaC9hcmMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgNSAt
LS0tLQogwqAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
