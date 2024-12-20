Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C756E7718C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3Z0UBx0PWI7C8Unhv3mop2WwzMSePpvOFb3EGAroGU=; b=a9ybK1XIlA0lNh
	/MWc+VSFVrYpbu9R6qvOCGKidBy1keGu/epl/Y6nvDdtq+uU2H1G6b+z0PpmhzjKFSQ1J45qbNt7S
	Ul6pl3UxZtXWKXQrPV40XpZSGJr8i/MYP9OGiRhB+s4uJKjeIbMU/GpEymlvuYCh0Vnck06lb5Dae
	fKTJE1qga3Ijdgv4yWmaJlEhr1Esl8JrelfDniEWNCgFeb0qec7cfNYatVaVijxOX+37Q7godVUSx
	wCBPYtHI8Tt2jwVCvdPHE8VGFH6hH7LQ1mCsAQm6qJi0nprvVdArekKTKh4H7r/n3elJZ/TJfokPC
	P/tbSOibnfJZFI8qrnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhvO-00000005phB-0DyE;
	Fri, 20 Dec 2024 18:40:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgZj-00000005auS-1Bdd
	for linux-snps-arc@lists.infradead.org;
	Fri, 20 Dec 2024 17:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 226A1A4205A;
	Fri, 20 Dec 2024 17:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79910C4CECD;
	Fri, 20 Dec 2024 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714846;
	bh=sEQTWj4HR8HWZedc1zbWiSWdQRj2vhJ8wMiBQ22nxcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NZBYosb72XB1VE4fehqN4e+OIJf7YoOkAmQ53TgbYAEEquHgr3PT5xvzXeWH8JLX4
	 azuW7862U2fOYorDmSQvEInbtP5EMpiMIFuUUulLJaDoVrtaNloVBsa7QBinN7EjuE
	 UO8RYS+4rchAMjSxLus8XoxGpgXjZCzd6C551c7yiWfrqM4Dwxkmp0opf9W/kGv1ZB
	 phgFcyVrPV/+kYlgu6EtIeH8jcnqs8M/59s9gi8EbEi4SzhqroWdenYYjj2j/dDUMx
	 kp+jqyrAa9RLTo2djS0ss9oDOybTAKRkflYH+RjYMuGfI0EV/DUpnPrmcrsz+FAa+V
	 yaTUA+YvCrjjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 9/9] ARC: build: Try to guess GCC variant of cross compiler
Date: Fri, 20 Dec 2024 12:13:47 -0500
Message-Id: <20241220171347.512287-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171347.512287-1-sashal@kernel.org>
References: <20241220171347.512287-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091407_387450_73D0B2DA 
X-CRM114-Status: UNSURE (   8.67  )
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
LS1naXQgYS9hcmNoL2FyYy9NYWtlZmlsZSBiL2FyY2gvYXJjL01ha2VmaWxlCmluZGV4IDg3ODJh
MDNmMjRhOC4uNjBiN2E3NzIzYjFlIDEwMDY0NAotLS0gYS9hcmNoL2FyYy9NYWtlZmlsZQorKysg
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
