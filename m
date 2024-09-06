Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F318CE7AFC
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Sep 2024 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bNu50QehHZjGVssrUWHXXbCRxKoc60e4ta2tf2qiUA=; b=ufVKKXU4t32wIy
	fvOwrZAxM5ByMmBZXpWJYJsaH5cLZo+lbkSMbUgAd/BhsEjekI69IYK2xSf6cMEWoP8S1jh4UAQQA
	GEWXR9DDkaskUFtNtwT0r/WW1QRaFYIgjzOPl+iUKz4nn64AiqslngQsn3YVoDPszhkHq3cGb7XaR
	9g8SYu7Lav55aAjTchephA3/rsNh+pWc8duW9/vadnSGzTfD30+fwqduyWhkyQPkWdEeUOqdBEcxX
	W3u2hKa6qI+Mg33RBSLW3SmanFlRosItDo2nktWYwxev3WWo8EGOBxpRyuqQhw5PVdRoOyV7Klzhc
	jdbJE5fmxySJdq4d3GJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smVWO-0000000BaCW-2xSQ;
	Fri, 06 Sep 2024 09:44:52 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smVPW-0000000BXZ4-0pRA;
	Fri, 06 Sep 2024 09:37:47 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X0WNf1FhNz9sRs;
	Fri,  6 Sep 2024 11:37:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKy3LdL3k-CP; Fri,  6 Sep 2024 11:37:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X0WNc6RQfz9sRy;
	Fri,  6 Sep 2024 11:37:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C3BE58B77C;
	Fri,  6 Sep 2024 11:37:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id of0oryN1Xdlh; Fri,  6 Sep 2024 11:37:36 +0200 (CEST)
Received: from [192.168.235.70] (unknown [192.168.235.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 65D348B764;
	Fri,  6 Sep 2024 11:37:34 +0200 (CEST)
Message-ID: <7c3720ff-b763-44b0-9b57-a2fbff3c7f56@csgroup.eu>
Date: Fri, 6 Sep 2024 11:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] execmem: add support for cache of large ROX pages
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Song Liu <song@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20240826065532.2618273-1-rppt@kernel.org>
 <20240826065532.2618273-8-rppt@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240826065532.2618273-8-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_023746_411263_FC315BDA 
X-CRM114-Status: GOOD (  12.91  )
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

CgpMZSAyNi8wOC8yMDI0IMOgIDA4OjU1LCBNaWtlIFJhcG9wb3J0IGEgw6ljcml0wqA6Cj4gRnJv
bTogIk1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkiIDxycHB0QGtlcm5lbC5vcmc+Cj4gCj4gVXNp
bmcgbGFyZ2UgcGFnZXMgdG8gbWFwIHRleHQgYXJlYXMgcmVkdWNlcyBpVExCIHByZXNzdXJlIGFu
ZCBpbXByb3Zlcwo+IHBlcmZvcm1hbmNlLgo+IAo+IEV4dGVuZCBleGVjbWVtX2FsbG9jKCkgd2l0
aCBhbiBhYmlsaXR5IHRvIHVzZSBQTURfU0laRSdlZCBwYWdlcyB3aXRoIFJPWAo+IHBlcm1pc3Np
b25zIGFzIGEgY2FjaGUgZm9yIHNtYWxsZXIgYWxsb2NhdGlvbnMuCgpXaHkgb25seSBQTURfU0la
RSA/CgpPbiBwb3dlciA4eHgsIFBNRF9TSVpFIGlzIDRNIGFuZCB0aGUgOHh4IGRvZXNuJ3QgaGF2
ZSBzdWNoIGEgcGFnZSBzaXplLiAKV2hlbiB5b3UgY2FsbCB2bWFsbG9jKCkgd2l0aCBWTV9BTExP
V19IVUdFX1ZNQVAgeW91IGdldCAxNmsgcGFnZXMgb3IgCjUxMmsgcGFnZXMgZGVwZW5kaW5nIG9u
IHRoZSBzaXplIHlvdSBhc2sgZm9yLCBzZWUgZnVuY3Rpb24gCmFyY2hfdm1hcF9wdGVfc3VwcG9y
dGVkX3NoaWZ0KCkKCj4gCj4gVG8gcG9wdWxhdGUgdGhlIGNhY2hlLCBhIHdyaXRhYmxlIGxhcmdl
IHBhZ2UgaXMgYWxsb2NhdGVkIGZyb20gdm1hbGxvYyB3aXRoCj4gVk1fQUxMT1dfSFVHRV9WTUFQ
LCBmaWxsZWQgd2l0aCBpbnZhbGlkIGluc3RydWN0aW9ucyBhbmQgdGhlbiByZW1hcHBlZCBhcwo+
IFJPWC4KPiAKPiBQb3J0aW9ucyBvZiB0aGF0IGxhcmdlIHBhZ2UgYXJlIGhhbmRlZCBvdXQgdG8g
ZXhlY21lbV9hbGxvYygpIGNhbGxlcnMKPiB3aXRob3V0IGFueSBjaGFuZ2VzIHRvIHRoZSBwZXJt
aXNzaW9ucy4KPiAKPiBXaGVuIHRoZSBtZW1vcnkgaXMgZnJlZWQgd2l0aCBleGVjbWVtX2ZyZWUo
KSBpdCBpcyBpbnZhbGlkYXRlZCBhZ2FpbiBzbwo+IHRoYXQgaXQgd29uJ3QgY29udGFpbiBzdGFs
ZSBpbnN0cnVjdGlvbnMuCj4gCj4gVGhlIGNhY2hlIGlzIGVuYWJsZWQgd2hlbiBhbiBhcmNoaXRl
Y3R1cmUgc2V0cyBFWEVDTUVNX1JPWF9DQUNIRSBmbGFnIGluCj4gZGVmaW5pdGlvbiBvZiBhbiBl
eGVjbWVtX3JhbmdlLgo+IAoKQ2hyaXN0b3BoZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNu
cHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
