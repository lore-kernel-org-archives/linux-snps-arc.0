Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFE2CAC595
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Sep 2024 18:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BP2bQzu/DmCATyo3wZFOA4RD6su66E+D5OcWwzXLKyE=; b=zur9p9fngBACsK
	UTa3NKmYL9uXz3ei3vKz7hcd9MDMi9mFTRxk7086phmP3rmX/8wpJ0HtBEh9BAFlUEziwEUe5XIQC
	g/RMJ5ku7D/lry/rOutNAg+45q7cZHoIw7iZVS48m1PyWtdCcdS0tQHobr9GqZq+TgJ57M3L19mqw
	UzZWOsfiZd+A/8hmFOmJrXkKQ7v0iPCdn1mIzTTBf3flDkoKyT9ocIY4hv+xYhXShWqs1W46i4pc8
	popufqkDQS46qNRBJqzI+EOWJzkC671yHE5xn6K2lPpO2VUu1UWu2HWDfafSvzzCwsujWcAiQUdPY
	m82bIA0Q7st8gTuQVMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqd5H-00000006hMk-1uRH;
	Tue, 17 Sep 2024 18:37:55 +0000
Received: from mail.clii.com.cn ([218.247.4.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqd5E-00000006hLl-35Gi
	for linux-snps-arc@lists.infradead.org;
	Tue, 17 Sep 2024 18:37:53 +0000
Received: from cnlic.org.cn (unknown [156.0.213.15])
	by mail.clii.com.cn (Server) with ESMTPSA id 4X7Vql3kmpz8BsX
	for <linux-snps-arc@lists.infradead.org>; Wed, 18 Sep 2024 02:36:51 +0800 (HKT)
From: Martina. M SCHULT <cace@cnlic.org.cn>
To: linux-snps-arc@lists.infradead.org
Subject: Guten Morgen
Date: 17 Sep 2024 19:36:50 +0100
Message-ID: <20240917193650.EBBD9F8136E52F56@cnlic.org.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_113752_954757_7ED788DD 
X-CRM114-Status: UNSURE (  -0.39  )
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
Reply-To: m.martinasch@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

R3V0ZW4gTW9yZ2VuLAoKCgpNZWluIE5hbWUgaXN0IE1hcnRpbmEgTWFyaWFuYSBTQ0hVTFQsIGRl
dXRzY2hlciBIZXJrdW5mdC4gSWNoIApsZWlkZSBhbiBlaW5lciBzY2h3ZXJlbiBLcmFua2hlaXQs
IGRpZSBtaWNoIHp1bSBzaWNoZXJlbiBUb2QgCnZlcnVydGVpbHQ6IEhpcm50dW1vci4KCkljaCB2
ZXJmw7xnZSDDvGJlciBlaW5lbiBCZXRyYWcgdm9uIGRyZWl6ZWhuIE1pbGxpb25lbiAKYWNodGh1
bmRlcnRmw7xuZnppZ3RhdXNlbmQgRXVybyAoMTMuODUwLjAwMCBFdXJvKSwgZGVuIGljaCAKenV2
ZXJsw6Rzc2lnIHVuZCBlaHJsaWNoIGFuIGVpbmVuIERyaXR0ZW4gZsO8ciBkZW4gdm9yZ2VzZWhl
bmVuIApWZXJ3ZW5kdW5nc3p3ZWNrIHdlaXRlcmdlYmVuIG3DtmNodGUuIEljaCBoYWJlIGVpbiBV
bnRlcm5laG1lbiwgCmRhcyBhdXMgYW5kZXJlbiBMw6RuZGVybiBpbXBvcnRpZXJ0LiBJY2ggaGFi
ZSBtZWluZW4gTWFubiB1bmQgendlaSAKZW50esO8Y2tlbmRlIEtpbmRlciBiZWkgZWluZW0gdW5n
bMO8Y2tsaWNoZW4gQXV0b3VuZmFsbCB2ZXJsb3Jlbi4KCkljaCBtw7ZjaHRlIElobmVuIGRpZXNl
biBCZXRyYWcgYW5iaWV0ZW4sIHVtIElociBQcm9qZWt0IHp1IApmaW5hbnppZXJlbiB1bmQgZGll
IGFtIHN0w6Rya3N0ZW4gYmVuYWNodGVpbGlndGVuIE1lbnNjaGVuLCAKS3JlYnNiZWhhbmRsdW5n
c3plbnRyZW4gdW5kIGRpZSB3ZW5pZ2VyIFByaXZpbGVnaWVydGVuIHp1IAp1bnRlcnN0w7x0emVu
LCBkZW5uIG1laW5lIFRhZ2Ugc2luZCBnZXrDpGhsdC4KIAoKVmllbGVuIERhbmsgZsO8ciBJaHJl
IEFudHdvcnQsIGRhbWl0IGljaCBtZWluZW0gTm90YXIgbWVpbmUgV2FobCAKZGVzIEJlZ8O8bnN0
aWd0ZW4gbWl0dGVpbGVuIGthbm4uCiBCaXR0ZSBiZWFjaHRlbiBTaWUsIGRhc3MgU2llIGhpZXIg
ZWluZSBFLU1haWwgc2VuZGVuIGvDtm5uZW46IAptLm1hcnRpbmFzY2hAZ21haWwuY29tLAoKCklj
aCB3ZXJkZSBtZWluZW4gVmVybcO2Z2Vuc3ZlcndhbHRlciwgZGVuIE5vdGFyIFBpZXJyZS1MdWMg
Vk9HRUwsIArDvGJlciBtZWluZSBTcGVuZGVuZW50c2NoZWlkdW5nIGluZm9ybWllcmVuLgoKIAoK
QXVmcmljaHRpZy4KIApNYXJ0aW5hLiBNIFNDSFVMVAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
