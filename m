Return-Path: <SRS0=KZrG=LC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C6DC47082
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Jun 2021 14:58:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F42961183
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Jun 2021 14:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F42961183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bT+ybKsJhFLygn/9wdWkZ3uwAS34h3F+Q+VvngEY3lU=; b=H6My+fEDQcvcc3HRp/vAd+NVu+
	6qv5drfNVbP4vRs7g3qw1qSM/M/No6K2d73LbL+gGLwZKoUpmkK01iWRwbjTN4LtgYUaxHHev80vs
	CDTtB7TK9G/gvBJbOQYEe9gVyYgcjwDmt1ZTJsc7hCK6hK655sRU8TQvYRXh/0tuXh1HZ8P2wOwyf
	7X0+3ASNM6twiseFY/rtjcI2coOJCnxDQud+cFCZKqmfKeCzohkMobSDibpEG+F1YKVbtngHD1fhU
	NOYEqRfki8JybBAHFPDYaRg0Vtgz4E81jbC8xFZZb/EBPu9ugGBy18P1QkrA+TZYQt90PhO6pWE2M
	QmprsefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqdBA-0093Qc-KU; Tue, 08 Jun 2021 14:58:08 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqdAp-0093FY-Is; Tue, 08 Jun 2021 14:57:49 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FztdJ6WHszBDj8;
 Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYF-J-sCzJxT; Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FztdJ5XkGzBDj7;
 Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A9A608B7BF;
 Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Kq4BMwCmb5qz; Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B2B78B7C0;
 Tue,  8 Jun 2021 16:57:39 +0200 (CEST)
Subject: Re: [PATCH v3 resend 01/15] mm: add setup_initial_init_mm() helper
To: Souptick Joarder <jrdr.linux@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, X86 ML <x86@kernel.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-2-wangkefeng.wang@huawei.com>
 <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <34f88fdc-1842-7954-bccc-0142a8d66eea@csgroup.eu>
Date: Tue, 8 Jun 2021 16:57:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_075747_794751_9748A045 
X-CRM114-Status: UNSURE (   9.23  )
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

CgpMZSAwOC8wNi8yMDIxIMOgIDE2OjUzLCBTb3VwdGljayBKb2FyZGVyIGEgw6ljcml0wqA6Cj4g
T24gVHVlLCBKdW4gOCwgMjAyMSBhdCAxOjU2IFBNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndh
bmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Cj4+IEFkZCBzZXR1cF9pbml0aWFsX2luaXRfbW0oKSBo
ZWxwZXIgdG8gc2V0dXAga2VybmVsIHRleHQsCj4+IGRhdGEgYW5kIGJyay4KPj4KPj4gQ2M6IGxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGludXgtY3NreUB2Z2VyLmtlcm5lbC5vcmcKPj4g
Q2M6IHVjbGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UuanAKPj4gQ2M6IGxpbnV4LW02
OGtAbGlzdHMubGludXgtbTY4ay5vcmcKPj4gQ2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMu
b3JnCj4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+PiBDYzogbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4+
IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+PiBDYzogeDg2QGtlcm5lbC5vcmcKPj4g
U2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+
PiAtLS0KPj4gICBpbmNsdWRlL2xpbnV4L21tLmggfCAzICsrKwo+PiAgIG1tL2luaXQtbW0uYyAg
ICAgICB8IDkgKysrKysrKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21t
LmgKPj4gaW5kZXggYzI3NGY3NWVmY2Y5Li4wMmFhMDU3NTQwYjcgMTAwNjQ0Cj4+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvbW0uaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPj4gQEAgLTI0NCw2
ICsyNDQsOSBAQCBpbnQgX19hZGRfdG9fcGFnZV9jYWNoZV9sb2NrZWQoc3RydWN0IHBhZ2UgKnBh
Z2UsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+Pgo+PiAgICNkZWZpbmUgbHJ1X3Rv
X3BhZ2UoaGVhZCkgKGxpc3RfZW50cnkoKGhlYWQpLT5wcmV2LCBzdHJ1Y3QgcGFnZSwgbHJ1KSkK
Pj4KPj4gK3ZvaWQgc2V0dXBfaW5pdGlhbF9pbml0X21tKHZvaWQgKnN0YXJ0X2NvZGUsIHZvaWQg
KmVuZF9jb2RlLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICplbmRfZGF0YSwg
dm9pZCAqYnJrKTsKPj4gKwo+IAo+IEdlbnRsZSBxdWVyeSAtPiBpcyB0aGVyZSBhbnkgbGltaXRh
dGlvbiB0byBhZGQgaW5saW5lIGZ1bmN0aW9ucyBpbgo+IHNldHVwX2FyY2goKSBmdW5jdGlvbnMg
PwoKS2VmZW5nIGp1c3QgZm9sbG93ZWQgY29tbWVudCBmcm9tIE1pa2UgSSBndWVzcywgc2VlIApo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIw
MjEwNjA0MDcwNjMzLjMyMzYzLTItd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20vIzI2OTYyNTMK
CkNocmlzdG9waGUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
