Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3FEC54E64
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 05:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OQO1MG3Q1FAZjlt1w0Ejvv3RS4bEqbkBywqAr5msnrc=; b=hH/cblqwhRE2+r
	gqY18n37vHxO0G+Ql2C0KAaEjfNDNyHA/9TeOS0rMSPv2rRn7SK5ffsKX2vbMcjofAs334KPgENfs
	U0MUHBSUQjs9HksZOJxWa9nlSJ2s1ai0Y03RctdG1iValu5co1+/fZFsWXJl19tSCrx7LkHRSdybe
	XIlsmYyPZwEx97pqYG2vws03qiacZbKNA1DqWD4iMp/KrY0A/Z+z0NuZ2N9oZM0qiC5UixEaGj7ZY
	IjjkW0wxyi9FNSFVAd5N3FpgLIg4pJrOroXN36aUtlqpvPtbj069EHIPXE1sH5d7x8xcy7Z0bwUR5
	DOjqIvz1w4abTRVas9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpi7L-0000000CX4K-3ezh;
	Thu, 28 Mar 2024 05:15:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpi7J-0000000CX3p-0r5o
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Mar 2024 05:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4D502CE2925;
	Thu, 28 Mar 2024 05:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F01C433F1;
	Thu, 28 Mar 2024 05:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711602953;
	bh=u42mRmXsX2D7qg88uypUrRexir9cdzCMYJarfsvxXek=;
	h=Date:To:From:Subject:From;
	b=bis2HmdHB4eq+iYVmT04mgi8VdzvSrte1gMvTQ9cCZznUoej1E5uiOCPl3Owx7a9G
	 EWfvx9TkgnbiT/GILJsgYbXISsd0jHFIta/nzMQuWI085a3N8ykoonOLGm2jYjV3me
	 knVt+OCsU/EJOcKBRBhj5tmK84Gi4Mtdd6+yhuSUqd/r4h6vNOcxQoQldcILerTrEK
	 0OK0jLz5k1ZY4O5V3g09FG5h7ASf5bQPHhV6lq+tfuFosP+mITeJrz5wGaX2IxO5F9
	 4ooHUqZf3u2Lgf4iexLX/aStQuMix8DHkn0lKMxamV1YWCtMQiTjtgtmOa96GfIq/X
	 rYWvWRiICr50w==
Message-ID: <a48fceb7-a50b-4083-b7e8-e91194268531@kernel.org>
Date: Wed, 27 Mar 2024 22:15:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alexey Brodkin <abrodkin@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>
From: Vineet Gupta <vgupta@kernel.org>
Subject: recent kernel warning
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_221557_440449_F72B5D1B 
X-CRM114-Status: UNSURE (   1.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

QWxleGV5LAoKQ2FuIHlvdSBoYXZlIHNvbWVvbmUgbG9vayBhdCB0aGUgZm9sbG93aW5nIGtlcm5l
bCB3YXJuaW5nOgoKwqAgRFRDwqDCoMKgwqAgYXJjaC9hcmMvYm9vdC9kdHMvaHNkay5kdGIKLi4v
YXJjaC9hcmMvYm9vdC9kdHMvaHNkay5kdHM6MjA3LjIzLTIzNS41OiBXYXJuaW5nCihpbnRlcnJ1
cHRfcHJvdmlkZXIpOiAvc29jL2V0aGVybmV0QDgwMDA6ICcjaW50ZXJydXB0LWNlbGxzJyBmb3Vu
ZCwgYnV0Cm5vZGUgaXMgbm90IGFuIGludGVycnVwdCBwcm92aWRlcgphcmNoL2FyYy9ib290L2R0
cy9oc2RrLmR0YjogV2FybmluZyAoaW50ZXJydXB0X21hcCk6IEZhaWxlZCBwcmVyZXF1aXNpdGUK
J2ludGVycnVwdF9wcm92aWRlcicKClRoeCwKLVZpbmVldAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
