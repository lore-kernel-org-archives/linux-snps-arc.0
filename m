Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CFCE7718B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noL9YVp+M6UWzF3JP80DBOvzhW3tJQOHiYLA2Jl/ZYk=; b=Y0/fEwUwJGgFJn
	XBTIg9HMCUHzZiqiRyziK3amQzjJR6lsWwX0r4TgZnqoEK1PrdA8X7G8/+a6BiiK9W+rAS696kFTI
	oUNGoT7SMeY7b2FU2oDKnpk2L/8CEFj4kwNTdNLKpdWgAM9Xhm5Sr2wbE9U9hxqipmzQXu+5CC4lr
	Jqi3epzYwSKeol4CsDx8og4seJtMG1b0Om5ZhvxP2RHQD8F8t9IIXbBSDp7ZggxJDfoh+CrQO/+2C
	NQZjmjvGmI0IYFIroFbznCABET0Fp5qCJeuDxBG0lkoFHV1DJM1L5nLon1hsxHoesKUQuajvKM3tf
	U6jJdqFEJJix1hASoW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgpv-00000005eAJ-1tkw;
	Fri, 20 Dec 2024 17:30:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgZP-00000005aq1-2n6x
	for linux-snps-arc@lists.infradead.org;
	Fri, 20 Dec 2024 17:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A2235C587F;
	Fri, 20 Dec 2024 17:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B435C4CEDD;
	Fri, 20 Dec 2024 17:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714826;
	bh=yn0Z0aegbw1mIQcLSMM7arnwATrsIPNePoLxI448R+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkupn39xNwsxs2fSoNmvbgM50gZituSVOGK4QMg+HuTo6GnDLu7mEAC4ceEDN8riG
	 1yZVRLRVg4BGzMCx05X+gesSB7NAb19HFzUadYfnKzSd4yjb2+yXlGo/4tCpvTfIQ6
	 RUlAqIUiLZvBZ79D6gWidBsUhg2aDwKd8p/OgwWOT+tftGhKJTkreNxeeNSzSU/zq7
	 zlzFROryZ84E/lJpfLyZp79doN2PeMq8iH7aQrvnRBRR4mZ+mUTbR3uIsuGV2UVSFv
	 c2DZhx5dJozt38fimnOTsw9tIOKnBOugRSldnljJc/yCz3dcyRQOvg4AyaUUwl+AZ+
	 5WuglYcoeceFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 12/12] ARC: build: Try to guess GCC variant of cross compiler
Date: Fri, 20 Dec 2024 12:13:17 -0500
Message-Id: <20241220171317.512120-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171317.512120-1-sashal@kernel.org>
References: <20241220171317.512120-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091347_749014_EFBBE992 
X-CRM114-Status: UNSURE (   8.77  )
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

RnJvbTogTGVvbiBSb21hbm92c2t5IDxsZW9ucm9AbnZpZGlhLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDgyNDkyN2U4ODQ1NjMzMWM3YTk5OWZkZjVkOWQyNzkyM2I2MTk1OTAgXQoKQVJDIEdDQyBj
b21waWxlciBpcyBwYWNrYWdlZCBzdGFydGluZyBmcm9tIEZlZG9yYSAzOWkgYW5kIHRoZSBHQ0MK
dmFyaWFudCBvZiBjcm9zcyBjb21waWxlIHRvb2xzIGhhcyBhcmMtbGludXgtZ251LSBwcmVmaXgg
YW5kIG5vdAphcmMtbGludXgtLiBUaGlzIGlzIGNhdXNpbmcgdGhhdCBDUk9TU19DT01QSUxFIHZh
cmlhYmxlIGlzIGxlZnQgdW5zZXQuCgpUaGlzIGNoYW5nZSBhbGxvd3MgYnVpbGRzIHdpdGhvdXQg
bmVlZCB0byBzdXBwbHkgQ1JPU1NfQ09NUElMRSBhcmd1bWVudAppZiBkaXN0cm8gcGFja2FnZSBp
cyB1c2VkLgoKQmVmb3JlIHRoaXMgY2hhbmdlOgokIG1ha2UgLWogMTI4IEFSQ0g9YXJjIFc9MSBk
cml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC8KICBnY2M6IHdhcm5pbmc6IOKAmC1tY3B1PeKAmSBp
cyBkZXByZWNhdGVkOyB1c2Ug4oCYLW10dW5lPeKAmSBvciDigJgtbWFyY2g94oCZIGluc3RlYWQK
ICBnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiDigJgtbW1lZGl1
bS1jYWxsc+KAmQogIGdjYzogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kLWxpbmUgb3B0aW9u
IOKAmC1tbG9ja+KAmQogIGdjYzogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kLWxpbmUgb3B0
aW9uIOKAmC1tdW5hbGlnbmVkLWFjY2Vzc+KAmQoKWzFdIGh0dHBzOi8vcGFja2FnZXMuZmVkb3Jh
cHJvamVjdC5vcmcvcGtncy9jcm9zcy1nY2MvZ2NjLWFyYy1saW51eC1nbnUvaW5kZXguaHRtbApT
aWduZWQtb2ZmLWJ5OiBMZW9uIFJvbWFub3Zza3kgPGxlb25yb0BudmlkaWEuY29tPgpTaWduZWQt
b2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZndXB0YUBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBT
YXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9hcmMvTWFrZWZpbGUgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FyYy9NYWtlZmlsZSBiL2FyY2gvYXJjL01ha2VmaWxlCmluZGV4IDMyOTQw
MGExYzM1NS4uOGU2ZjUyYzY2MjZkIDEwMDY0NAotLS0gYS9hcmNoL2FyYy9NYWtlZmlsZQorKysg
Yi9hcmNoL2FyYy9NYWtlZmlsZQpAQCAtNiw3ICs2LDcgQEAKIEtCVUlMRF9ERUZDT05GSUcgOj0g
aGFwc19oc19zbXBfZGVmY29uZmlnCiAKIGlmZXEgKCQoQ1JPU1NfQ09NUElMRSksKQotQ1JPU1Nf
Q09NUElMRSA6PSAkKGNhbGwgY2MtY3Jvc3MtcHJlZml4LCBhcmMtbGludXgtIGFyY2ViLWxpbnV4
LSkKK0NST1NTX0NPTVBJTEUgOj0gJChjYWxsIGNjLWNyb3NzLXByZWZpeCwgYXJjLWxpbnV4LSBh
cmNlYi1saW51eC0gYXJjLWxpbnV4LWdudS0pCiBlbmRpZgogCiBjZmxhZ3MteQkrPSAtZm5vLWNv
bW1vbiAtcGlwZSAtZm5vLWJ1aWx0aW4gLW1tZWRpdW0tY2FsbHMgLURfX2xpbnV4X18KLS0gCjIu
MzkuNQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25w
cy1hcmMK
