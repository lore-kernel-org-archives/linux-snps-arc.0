Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63F8E77188
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5E+fUe3L6JJwHAma2dG0/pL3NrTEJw9/r6ec74GSSAI=; b=AOruxN3RbfCtZ2
	oV5BFPH1nYs4yHawpwtBRUKtLLjJU66cpHOZomdCU2VbJXz7pyfW5XhAN01mNkXbON/VmAZF2A+vw
	nJWNB5rYOhayyhlOPvwN3wteesZy1V3xGr1qcfMqTJXqTyB8pDay5HaatSsMKGkbhePH/uZiG/Lk4
	VkWn0nESWSWXE5ven/2uZ/DNnfEV2BJ0MIr1F7J2OKuwaJ2/0nXTLPgwl5pWpah9XRZRsnuXqTL+I
	y1xKnCzgxhok1TUCdsJuqd9aFEESWxyD3t/ngI7CsKVLPL9qXKJphwH3uAEYKRFeEO3tl5L34hpx5
	Q98HTztxK6BF0Ra6C1IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgtH-00000005ef8-2tWC;
	Fri, 20 Dec 2024 17:34:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOga8-00000005b0s-1d6y
	for linux-snps-arc@lists.infradead.org;
	Fri, 20 Dec 2024 17:14:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA58A5C5B08;
	Fri, 20 Dec 2024 17:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA899C4CECD;
	Fri, 20 Dec 2024 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714871;
	bh=9GTWoR6PqFOG4LQ05T1IJwxSFN+f5JKVLAdh9xrqC9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tUQgAcLxhng8RILIvGMIZIj6VUMIPc3waDT7Lhl0nz+CNlwE7bnJORB2FXcgD144t
	 ShvlJr5I0zLK1k1yBI/7lXdFx/oky45RXGgU39C/zNsw+Z345hOULmtz40WkPN8VOw
	 PrTzISEaCPdPA/prAJUv2HOcedUlvxFcPUrtINErpgBhnpfUbKEaca8vII9nUAj/vQ
	 vjUFBRvd4uw5wZ5ExNCtrjUASIpknDaj07Pf9qNOZjcvvjK/4nvKKQrXtwbFpeHmOD
	 kep4ubOcTK5pPj6wR7V2vJS9RvsjoAz8oVEZiz2/36MIJyX7TstIIXWA4SwioYgRyf
	 xTbVmMaaJNjWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 6/6] ARC: build: Try to guess GCC variant of cross compiler
Date: Fri, 20 Dec 2024 12:14:20 -0500
Message-Id: <20241220171420.512513-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171420.512513-1-sashal@kernel.org>
References: <20241220171420.512513-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091432_470207_7E8899D3 
X-CRM114-Status: UNSURE (   8.94  )
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
LS1naXQgYS9hcmNoL2FyYy9NYWtlZmlsZSBiL2FyY2gvYXJjL01ha2VmaWxlCmluZGV4IDZmMDVl
NTA5ODg5Zi4uZDcyZDlmNGRmYzNkIDEwMDY0NAotLS0gYS9hcmNoL2FyYy9NYWtlZmlsZQorKysg
Yi9hcmNoL2FyYy9NYWtlZmlsZQpAQCAtNiw3ICs2LDcgQEAKIEtCVUlMRF9ERUZDT05GSUcgOj0g
bnNpbV9oc19kZWZjb25maWcKIAogaWZlcSAoJChDUk9TU19DT01QSUxFKSwpCi1DUk9TU19DT01Q
SUxFIDo9ICQoY2FsbCBjYy1jcm9zcy1wcmVmaXgsIGFyYy1saW51eC0gYXJjZWItbGludXgtKQor
Q1JPU1NfQ09NUElMRSA6PSAkKGNhbGwgY2MtY3Jvc3MtcHJlZml4LCBhcmMtbGludXgtIGFyY2Vi
LWxpbnV4LSBhcmMtbGludXgtZ251LSkKIGVuZGlmCiAKIGNmbGFncy15CSs9IC1mbm8tY29tbW9u
IC1waXBlIC1mbm8tYnVpbHRpbiAtbW1lZGl1bS1jYWxscyAtRF9fbGludXhfXwotLSAKMi4zOS41
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
