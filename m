Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA114CAC597
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Sep 2025 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0Urht1SnbPjD9RO98eig7/cNcQ5fBmKLngnR+8elkY=; b=vCUSO3mYseqLVJ
	+7rbMGM3ptcZQOutoCGwb98WQAW1QBvyVA8JIp/ybwzGKAxZw6GjazgbMqcPPpjWKJTtCnQG+X4f0
	sBpyLQl0qsY8ku1Hrd3+uxZ+nXd17BLKxcpnuES4z8o0fP36s2OULXT8d2QxxW2rZdukYvz0PAEWj
	8HIWa5LRySUd+y7Q+PcW6c3kHcA3JdtibHTq0K44M/6puzfjOAd5WIMtSNKQs24VmMSEQP2NqrdKM
	Afvu3lukZG0JCbDmmR/Kh36fZL+b5SqUs5XamW4Bo7EOLfJY0b62kD3XI82tXmOOjazTeDH+Gs03m
	jwV8BS/ZfodqqcuHe6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7jP-000000040Of-2vou;
	Mon, 15 Sep 2025 11:50:51 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7jL-000000040JR-2S9P;
	Mon, 15 Sep 2025 11:50:49 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQMty1PZPz9sxj;
	Mon, 15 Sep 2025 13:17:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3y6qLNUbAYQ5; Mon, 15 Sep 2025 13:17:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQMtx060wz9sxg;
	Mon, 15 Sep 2025 13:17:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BF74D8B766;
	Mon, 15 Sep 2025 13:17:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LLgTqAL1YNfN; Mon, 15 Sep 2025 13:17:12 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F017B8B763;
	Mon, 15 Sep 2025 13:17:11 +0200 (CEST)
Message-ID: <8b56da8e-42d1-4548-8e39-286010c5d84a@csgroup.eu>
Date: Mon, 15 Sep 2025 13:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 01/62] init: remove deprecated "load_ramdisk"
 command line parameter, which does nothing
To: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>,
 Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org,
 initramfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>,
 Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-2-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-2-safinaskar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_045047_785658_9B85665A 
X-CRM114-Status: GOOD (  15.24  )
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

CgpMZSAxMy8wOS8yMDI1IMOgIDAyOjM3LCBBc2thciBTYWZpbiBhIMOpY3JpdMKgOgo+IFtWb3Vz
IG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIHNhZmluYXNrYXJAZ21haWwu
Y29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRwczovL2Fr
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+IAo+IFRoaXMgaXMgcHJlcGFy
YXRpb24gZm9yIGluaXRyZCByZW1vdmFsCgoKU3F1YXNoIHBhdGNoIDEgYW5kIHBhdGNoIDIgdG9n
ZXRoZXIgYW5kIHNheSB0aGlzIGlzIGNsZWFudXAgb2YgdHdvIApvcHRpb25zIGRlcHJlY2F0ZWQg
YnkgY29tbWl0IGM4Mzc2OTk0Yzg2YyAoImluaXRyZDogcmVtb3ZlIHN1cHBvcnQgZm9yIAptdWx0
aXBsZSBmbG9wcGllcyIpIHdpdGggdGhlIGRvY3VtZW50YXRpb24gYnkgY29tbWl0IDZiOTllNmU2
YWE2MiAKKCJEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlOiBibG9ja2Rldi9yYW1kaXNrOiByZW1v
dmUgdXNlIG9mICJyZGV2IiIpCgpDaHJpc3RvcGhlCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBc2th
ciBTYWZpbiA8c2FmaW5hc2thckBnbWFpbC5jb20+Cj4gLS0tCj4gICBEb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCB8IDIgLS0KPiAgIGFyY2gvYXJtL2NvbmZp
Z3MvbmVwb25zZXRfZGVmY29uZmlnICAgICAgICAgICAgIHwgMiArLQo+ICAgaW5pdC9kb19tb3Vu
dHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA3IC0tLS0tLS0KPiAgIDMgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0Rv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gaW5kZXggNzQ3
YTU1YWJmNDk0Li5kM2IwNWNlMjQ5ZmYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IEBAIC0zMjc1LDggKzMyNzUsNiBAQAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBJZiB0aGVyZSBhcmUgbXVsdGlwbGUgbWF0Y2hpbmcgY29u
ZmlndXJhdGlvbnMgY2hhbmdpbmcKPiAgICAgICAgICAgICAgICAgICAgICAgICAgdGhlIHNhbWUg
YXR0cmlidXRlLCB0aGUgbGFzdCBvbmUgaXMgdXNlZC4KPiAKPiAtICAgICAgIGxvYWRfcmFtZGlz
az0gICBbUkFNXSBbRGVwcmVjYXRlZF0KPiAtCj4gICAgICAgICAgbG9ja2QubmxtX2dyYWNlX3Bl
cmlvZD1QICBbTkZTXSBBc3NpZ24gZ3JhY2UgcGVyaW9kLgo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBGb3JtYXQ6IDxpbnRlZ2VyPgo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdz
L25lcG9uc2V0X2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvbmVwb25zZXRfZGVmY29uZmln
Cj4gaW5kZXggMjIyN2Y4NjEwMGFkLi4xNmY3MzAwMjM5ZGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9h
cm0vY29uZmlncy9uZXBvbnNldF9kZWZjb25maWcKPiArKysgYi9hcmNoL2FybS9jb25maWdzL25l
cG9uc2V0X2RlZmNvbmZpZwo+IEBAIC05LDcgKzksNyBAQCBDT05GSUdfQVNTQUJFVF9ORVBPTlNF
VD15Cj4gICBDT05GSUdfWkJPT1RfUk9NX1RFWFQ9MHg4MDAwMAo+ICAgQ09ORklHX1pCT09UX1JP
TV9CU1M9MHhjMTAwMDAwMAo+ICAgQ09ORklHX1pCT09UX1JPTT15Cj4gLUNPTkZJR19DTURMSU5F
PSJjb25zb2xlPXR0eVNBMCwzODQwMG44IGNwdWZyZXE9MjIxMjAwIHJ3IHJvb3Q9L2Rldi9tdGRi
bG9jazIgbXRkcGFydHM9c2ExMTAwOjUxMksoYm9vdCksMU0oa2VybmVsKSwyNTYwSyhpbml0cmQp
LDRNKHJvb3QpIGxvYWRfcmFtZGlzaz0xIHByb21wdF9yYW1kaXNrPTAgbWVtPTMyTSBub2luaXRy
ZCBpbml0cmQ9MHhjMDgwMDAwMCwzTSIKPiArQ09ORklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0Ew
LDM4NDAwbjggY3B1ZnJlcT0yMjEyMDAgcncgcm9vdD0vZGV2L210ZGJsb2NrMiBtdGRwYXJ0cz1z
YTExMDA6NTEySyhib290KSwxTShrZXJuZWwpLDI1NjBLKGluaXRyZCksNE0ocm9vdCkgcHJvbXB0
X3JhbWRpc2s9MCBtZW09MzJNIG5vaW5pdHJkIGluaXRyZD0weGMwODAwMDAwLDNNIgo+ICAgQ09O
RklHX0ZQRV9OV0ZQRT15Cj4gICBDT05GSUdfUE09eQo+ICAgQ09ORklHX01PRFVMRVM9eQo+IGRp
ZmYgLS1naXQgYS9pbml0L2RvX21vdW50cy5jIGIvaW5pdC9kb19tb3VudHMuYwo+IGluZGV4IDZh
ZjI5ZGE4ODg5ZS4uMGYyZjQ0ZTYyNTBjIDEwMDY0NAo+IC0tLSBhL2luaXQvZG9fbW91bnRzLmMK
PiArKysgYi9pbml0L2RvX21vdW50cy5jCj4gQEAgLTM0LDEzICszNCw2IEBAIHN0YXRpYyBpbnQg
cm9vdF93YWl0Owo+IAo+ICAgZGV2X3QgUk9PVF9ERVY7Cj4gCj4gLXN0YXRpYyBpbnQgX19pbml0
IGxvYWRfcmFtZGlzayhjaGFyICpzdHIpCj4gLXsKPiAtICAgICAgIHByX3dhcm4oImlnbm9yaW5n
IHRoZSBkZXByZWNhdGVkIGxvYWRfcmFtZGlzaz0gb3B0aW9uXG4iKTsKPiAtICAgICAgIHJldHVy
biAxOwo+IC19Cj4gLV9fc2V0dXAoImxvYWRfcmFtZGlzaz0iLCBsb2FkX3JhbWRpc2spOwo+IC0K
PiAgIHN0YXRpYyBpbnQgX19pbml0IHJlYWRvbmx5KGNoYXIgKnN0cikKPiAgIHsKPiAgICAgICAg
ICBpZiAoKnN0cikKPiAtLQo+IDIuNDcuMgo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
