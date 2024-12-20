Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02456E77188
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 17:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLfSrovbeNYVMK+kKgKhdwCPwIiWjuHn9kvvtfn8VhM=; b=DMD5bS4kr9gtw2
	k8kiNZWEKhuFfbaVShhewhbP3glUdLbq8Isd8pZFfT90KzC2sInFpZBNnmAkByCDXcA5TuW5ScHdT
	/eL1vDHGHAKzYfvi5sYhyPZIlwWQJ2aH99YTAAS3iRyOS/30KeMQR39xOCe2yi3IrR7I1CnYCXus4
	hpP55f2Le+7/S4JmzTwYnhUBHj7tXE377rPrY1SJVnMbe75VwvrFa0WLYcboxt2zxlcuWeCB3XmJz
	geR/FPf+U9YhTMppHFY1a07Asi/t1yLUDQA7efYzy/m0GeaC/d1YvCRwb8Z2N6wDHxWrWyb9hkvpw
	w6QVlDBpD++4SzUTuqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgsA-00000005eSf-3BbT;
	Fri, 20 Dec 2024 17:33:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgZw-00000005axO-2RKH
	for linux-snps-arc@lists.infradead.org;
	Fri, 20 Dec 2024 17:14:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28CC35C4831;
	Fri, 20 Dec 2024 17:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F376C4CEDC;
	Fri, 20 Dec 2024 17:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714859;
	bh=cK40Yh5l8+Qul7VYoKGGByl+MrG6zQ4WpNS33BHo8pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WH7801ZvNsc1j2vpSjlTbjZ7nCETjHo5TDF1TRwAFZt7I2OAFfiv7vsDnbiI1H60B
	 UEUnhBPWmekjkyVJcHPO3y9sMyamfMv2YBy4JwtrR5//UgOxiGZ9i/UQWmFjbzycnU
	 vJdnr5Ng1muMevmjhgYt0NBZ5GpKAr4lzyy/95SzwkIw+BZXtiKE3mhERb971MbpUA
	 6FrXAqoV0f5cMq8ps0uy1plXkFfQU+VYVLHQRJpd9hkZisQrmIx3SGKyIyfWt5Oo9w
	 iBRIxYIERMpCIDk/qFfp/HAyl12gseV6+S+om9Tpf3A9ZUnqln7CLiED3u7mOYxbct
	 7GoZxq0f8EbBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 7/7] ARC: build: Try to guess GCC variant of cross compiler
Date: Fri, 20 Dec 2024 12:14:06 -0500
Message-Id: <20241220171406.512413-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171406.512413-1-sashal@kernel.org>
References: <20241220171406.512413-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091420_664151_2765110A 
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
LS1naXQgYS9hcmNoL2FyYy9NYWtlZmlsZSBiL2FyY2gvYXJjL01ha2VmaWxlCmluZGV4IDU3OGJk
YmJiMGZhNy4uMThmNGIyNDUyMDc0IDEwMDY0NAotLS0gYS9hcmNoL2FyYy9NYWtlZmlsZQorKysg
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
