Return-Path: <SRS0=fhZ4=36=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E4EC352A3
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Feb 2020 10:46:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB82020842
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Feb 2020 10:46:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qp/6L5wn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="RdSNVpl3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB82020842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+MKggo2TcOYL7Hpx5Ohos1d61MuJyijksUtBTHJfaEc=; b=qp/6L5wnzQ8o0AAimigDF0wG2
	Xg4kE19HJnNCOalJmhX2l8nCcZhkBFHC5bmrkekpZe6MmiPiH3NFJR4MbZno/S8Q4PL+yWgAa0tdz
	jFEgUQAeTtujmqe8yZZ9gas+MHoGDvKkpE0LfqkC92XRz3orodYAnAYT27yoOCtJszW5MhpUSFmX9
	2bNHaoNG6HeFshZ4y23WbNAfThHd6zFkYtJotW49UuJhVq1GDQXlEQqHpYdRdCXs8NNq3wFyFWVqt
	SXbX8Wp+pxZyzBpGTs4DBHCaBlS0PdzTW1QCn/gUo1s07WpeEfVayWgwxPzSl10vRA1Rh2wNi5OLR
	Vw/mlFOeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j16aW-0008Dj-1E; Mon, 10 Feb 2020 10:46:48 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j16aQ-0008C2-Uc; Mon, 10 Feb 2020 10:46:45 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48GMyn4XNDzB09b8;
 Mon, 10 Feb 2020 11:46:25 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RdSNVpl3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2YKBWszaeG8b; Mon, 10 Feb 2020 11:46:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48GMyn31lmzB09b6;
 Mon, 10 Feb 2020 11:46:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581331585; bh=3VdT8leEAlfSLQpPQKoxenZVPWjYs1yN+U09thgTRJA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RdSNVpl3eRdV3gPJ7XDvUegm6wZGug8ejVpKq74HLxDjFS3pwYqC+BZGFoUQ1Oq78
 SVulkxR8i/NmQfPxXj9q1ZP6MDJ4/eVa8ThwXr9rdv9XZ0ODywoTCAXN5cQTc5KVGa
 aEm6pzX4mgbIsgNXEcKTlXONuuV1vYFncq9hDwgQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 295478B7B8;
 Mon, 10 Feb 2020 11:46:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VHUUj31ZCU6T; Mon, 10 Feb 2020 11:46:29 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A8808B7B5;
 Mon, 10 Feb 2020 11:46:23 +0100 (CET)
Subject: Re: [PATCH V13] mm/debug: Add tests validating architecture page
 table helpers
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <1580897674-16456-1-git-send-email-anshuman.khandual@arm.com>
 <202002060619.wEOdAZU1%lkp@intel.com>
 <78d3ce6b-e100-2561-6b09-124c29731d1a@arm.com>
 <20200209205231.44d098f8749e88190b8ba10c@linux-foundation.org>
 <955229f7-f161-f720-0e75-a3163f63817d@arm.com>
 <aef1048f-68c4-d14f-e669-8f288ba9ac7a@c-s.fr>
 <20200210100200.GB25745@shell.armlinux.org.uk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7cb3a5bb-eaea-a01c-4047-e3c000b7ad1d@c-s.fr>
Date: Mon, 10 Feb 2020 11:46:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210100200.GB25745@shell.armlinux.org.uk>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_024643_287587_21BDA9E7 
X-CRM114-Status: GOOD (  23.92  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-m68k@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, kbuild test robot <lkp@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-alpha@vger.kernel.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, linux-c6x-dev@linux-c6x.org,
 Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org,
 Brian Cain <bcain@codeaurora.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAxMC8wMi8yMDIwIMOgIDExOjAyLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4g
YSDDqWNyaXTCoDoKPiBPbiBNb24sIEZlYiAxMCwgMjAyMCBhdCAwNzozODozOEFNICswMTAwLCBD
aHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAxMC8wMi8yMDIwIMOgIDA2OjM1LCBB
bnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+Pj4KPj4+Cj4+PiBPbiAwMi8xMC8yMDIwIDEw
OjIyIEFNLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+Pj4+IE9uIFRodSwgNiBGZWIgMjAyMCAxMzo0
OTozNSArMDUzMCBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4g
d3JvdGU6Cj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMDIvMDYvMjAyMCAwNDo0MCBBTSwga2J1aWxkIHRl
c3Qgcm9ib3Qgd3JvdGU6Cj4+Pj4+PiBIaSBBbnNodW1hbiwKPj4+Pj4+Cj4+Pj4+PiBUaGFuayB5
b3UgZm9yIHRoZSBwYXRjaCEgWWV0IHNvbWV0aGluZyB0byBpbXByb3ZlOgo+Pj4+Pj4KPj4+Pj4+
IFthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gcG93ZXJwYy9uZXh0XQo+Pj4+Pj4gW2Fsc28gYnVp
bGQgdGVzdCBFUlJPUiBvbiBzMzkwL2ZlYXR1cmVzIGxpbnVzL21hc3RlciBhcmMvZm9yLW5leHQg
djUuNV0KPj4+Pj4+IFtjYW5ub3QgYXBwbHkgdG8gbW1vdG0vbWFzdGVyIHRpcC94ODYvY29yZSBh
cm02NC9mb3ItbmV4dC9jb3JlIG5leHQtMjAyMDAyMDVdCj4+Pj4+PiBbaWYgeW91ciBwYXRjaCBp
cyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3AgdXMgYSBub3RlIHRv
IGhlbHAKPj4+Pj4+IGltcHJvdmUgdGhlIHN5c3RlbS4gQlRXLCB3ZSBhbHNvIHN1Z2dlc3QgdG8g
dXNlICctLWJhc2UnIG9wdGlvbiB0byBzcGVjaWZ5IHRoZQo+Pj4+Pj4gYmFzZSB0cmVlIGluIGdp
dCBmb3JtYXQtcGF0Y2gsIHBsZWFzZSBzZWUgaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9hLzM3
NDA2OTgyXQo+Pj4+Pj4KPj4+Pj4+IHVybDogICAgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kv
bGludXgvY29tbWl0cy9BbnNodW1hbi1LaGFuZHVhbC9tbS1kZWJ1Zy1BZGQtdGVzdHMtdmFsaWRh
dGluZy1hcmNoaXRlY3R1cmUtcGFnZS10YWJsZS1oZWxwZXJzLzIwMjAwMjA1LTIxNTUwNwo+Pj4+
Pj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9wb3dlcnBjL2xpbnV4LmdpdCBuZXh0Cj4+Pj4+PiBjb25maWc6IGlhNjQtYWxsbW9kY29uZmln
IChhdHRhY2hlZCBhcyAuY29uZmlnKQo+Pj4+Pj4gY29tcGlsZXI6IGlhNjQtbGludXgtZ2NjIChH
Q0MpIDcuNS4wCj4+Pj4+PiByZXByb2R1Y2U6Cj4+Pj4+PiAgICAgICAgICAgd2dldCBodHRwczov
L3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwvbGtwLXRlc3RzL21hc3Rlci9zYmluL21h
a2UuY3Jvc3MgLU8gfi9iaW4vbWFrZS5jcm9zcwo+Pj4+Pj4gICAgICAgICAgIGNobW9kICt4IH4v
YmluL21ha2UuY3Jvc3MKPj4+Pj4+ICAgICAgICAgICAjIHNhdmUgdGhlIGF0dGFjaGVkIC5jb25m
aWcgdG8gbGludXggYnVpbGQgdHJlZQo+Pj4+Pj4gICAgICAgICAgIEdDQ19WRVJTSU9OPTcuNS4w
IG1ha2UuY3Jvc3MgQVJDSD1pYTY0Cj4+Pj4+Pgo+Pj4+Pj4gSWYgeW91IGZpeCB0aGUgaXNzdWUs
IGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwo+Pj4+Pj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+Pj4+Pj4KPj4+Pj4+IEFsbCBlcnJvci93YXJuaW5ncyAo
bmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOgo+Pj4+Pj4KPj4+Pj4+ICAgICAgSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIGluY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3B1ZC5oOjg6MCwKPj4+Pj4+
ICAgICAgICAgICAgICAgICAgICAgICBmcm9tIGFyY2gvaWE2NC9pbmNsdWRlL2FzbS9wZ3RhYmxl
Lmg6NTg2LAo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9t
bS5oOjk5LAo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9o
aWdobWVtLmg6OCwKPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBmcm9tIG1tL2RlYnVnX3Zt
X3BndGFibGUuYzoxNDoKPj4+Pj4+ICAgICAgbW0vZGVidWdfdm1fcGd0YWJsZS5jOiBJbiBmdW5j
dGlvbiAncHVkX2NsZWFyX3Rlc3RzJzoKPj4+Pj4+Pj4gaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3Rh
YmxlLW5vcDRkLWhhY2suaDo0NzozMjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uICdfX3BnZCc7IGRpZCB5b3UgbWVhbiAnX19wNGQnPyBbLVdlcnJvcj1pbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KPj4+Pj4+ICAgICAgICNkZWZpbmUgX19wdWQoeCkgICAgKChw
dWRfdCkgeyBfX3BnZCh4KSB9KQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KPj4+Pj4+Pj4gbW0vZGVidWdfdm1fcGd0YWJsZS5jOjE0MTo4OiBub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8gJ19fcHVkJwo+Pj4+Pj4gICAgICAgIHB1ZCA9IF9fcHVkKHB1ZF92
YWwocHVkKSB8IFJBTkRPTV9PUlZBTFVFKTsKPj4+Pj4+ICAgICAgICAgICAgICBefn5+fgo+Pj4+
Pj4+PiBpbmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUtbm9wNGQtaGFjay5oOjQ3OjIyOiB3YXJu
aW5nOiBtaXNzaW5nIGJyYWNlcyBhcm91bmQgaW5pdGlhbGl6ZXIgWy1XbWlzc2luZy1icmFjZXNd
Cj4+Pj4+PiAgICAgICAjZGVmaW5lIF9fcHVkKHgpICAgICgocHVkX3QpIHsgX19wZ2QoeCkgfSkK
Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4+Pj4+Pj4gbW0vZGVidWdfdm1f
cGd0YWJsZS5jOjE0MTo4OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ19fcHVkJwo+Pj4+
Pj4gICAgICAgIHB1ZCA9IF9fcHVkKHB1ZF92YWwocHVkKSB8IFJBTkRPTV9PUlZBTFVFKTsKPj4+
Pj4+ICAgICAgICAgICAgICBefn5+fgo+Pj4+Pj4gICAgICBjYzE6IHNvbWUgd2FybmluZ3MgYmVp
bmcgdHJlYXRlZCBhcyBlcnJvcnMKPj4+Pj4KPj4+Pj4gVGhpcyBidWlsZCBmYWlsdXJlIGlzIGV4
cGVjdGVkIG5vdyBnaXZlbiB0aGF0IHdlIGhhdmUgYWxsb3dlZCBERUJVR19WTV9QR1RBQkxFCj4+
Pj4+IHdpdGggRVhQRVJUIHdpdGhvdXQgcGxhdGZvcm0gcmVxdWlyaW5nIEFSQ0hfSEFTX0RFQlVH
X1ZNX1BHVEFCTEUuIFRoaXMgcHJvYmxlbQo+Pj4+PiBpLmUgYnVpbGQgZmFpbHVyZSBjYXVzZWQg
d2l0aG91dCBhIHBsYXRmb3JtIF9fcGdkKCksIGlzIGtub3duIHRvIGV4aXN0IGJvdGggb24KPj4+
Pj4gaWE2NCBhbmQgYXJtICgzMmJpdCkgcGxhdGZvcm1zLiBQbGVhc2UgcmVmZXIgaHR0cHM6Ly9s
a21sLm9yZy9sa21sLzIwMTkvOS8yNC8zMTQKPj4+Pj4gZm9yIGRldGFpbHMgd2hlcmUgdGhpcyB3
YXMgZGlzY3Vzc2VkIGVhcmxpZXIuCj4+Pj4+Cj4+Pj4KPj4+PiBJJ2QgcHJlZmVyIG5vdCB0byBt
ZXJnZSBhIHBhdGNoIHdoaWNoIGlzIGtub3duIHRvIGNhdXNlIGJ1aWxkCj4+Pj4gcmVncmVzc2lv
bnMuICBJcyB0aGVyZSBzb21lIHRlbXBvcmFyeSB0aGluZyB3ZSBjYW4gZG8gdG8gcHJldmVudCB0
aGVzZQo+Pj4+IGVycm9ycyB1bnRpbCBhcmNoIG1haW50YWluZXJzKD8pIGdldCBhcm91bmQgdG8g
aW1wbGVtZW50aW5nIHRoZQo+Pj4+IGxvbmctdGVybSBmaXhlcz8KPj4+Cj4+PiBXZSBjb3VsZCBl
eHBsaWNpdGx5IGRpc2FibGUgQ09ORklHX0RFQlVHX1ZNX1BHVEFCTEUgb24gaWE2NCBhbmQgYXJt
IHBsYXRmb3Jtcwo+Pj4gd2hpY2ggd2lsbCBlbnN1cmUgdGhhdCBvdGhlcnMgY2FuIHN0aWxsIHVz
ZSB0aGUgRVhQRVJUIHBhdGguCj4+Pgo+Pj4gY29uZmlnIERFQlVHX1ZNX1BHVEFCTEUKPj4+IAli
b29sICJEZWJ1ZyBhcmNoIHBhZ2UgdGFibGUgZm9yIHNlbWFudGljcyBjb21wbGlhbmNlIgo+Pj4g
CWRlcGVuZHMgb24gTU1VCj4+PiAJZGVwZW5kcyBvbiAhKElBNjQgfHwgQVJNKQo+Pj4gCWRlcGVu
ZHMgb24gQVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRSB8fCBFWFBFUlQKPj4+IAlkZWZhdWx0IG4g
aWYgIUFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUKPj4+IAlkZWZhdWx0IHkgaWYgREVCVUdfVk0K
Pj4+Cj4+Cj4+IE9uIGJvdGggaWEzMiBhbmQgYXJtLCB0aGUgZml4IGlzIHRyaXZpYWwuCj4+Cj4+
IENhbiB3ZSBpbmNsdWRlIHRoZSBmaXggd2l0aGluIHRoaXMgcGF0Y2gsIGp1c3QgdGhlIHNhbWUg
d2F5IGFzIHRoZQo+PiBtbV9wNGRfZm9sZGVkKCkgZml4IGZvciB4ODYgPwo+IAo+IFdoeSBzaG91
bGQgYXJtIGluY2x1ZGUgYSBtYWNybyBmb3Igc29tZXRoaW5nIHRoYXQgbm90aGluZyAoYXBhcnQg
ZnJvbQo+IHRoaXMgY2hlY2tlcikgcmVxdWlyZXM/ICBJZiB0aGUgY2hlY2tlciByZXF1aXJlcyBp
dCBidXQgdGhlIHJlc3Qgb2YKPiB0aGUga2VybmVsIGRvZXMgbm90LCBpdCBzdWdnZXN0cyB0aGF0
IHRoZSBjaGVja2VyIGlzbid0IGFjdHVhbGx5Cj4gY29ycmVjdCwgYW5kIHRoZSByZXN1bHRzIGNh
bid0IGJlIHJlbGllZCB1cG9uLgo+IAoKQXMgZmFyIGFzIEkgY2FuIHNlZSwgdGhlIHByb2JsZW0g
aXMgdGhhdCBhcm0gb3BlbmNvZGVzIHBhcnQgb2YgdGhlIEFQSSAKaW5zdGVhZCBvZiBpbmNsdWRp
bmcgYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3BtZC5oCgpIZXJlLCB0aGUgQVJNIGhhcyAyIGxldmVs
cywgaWUgb25seSBQR0QgYW5kIFBURS4gQnV0IGluc3RlYWQgb2YgZGVmaW5pbmcgCl9fcGdkIGFu
ZCBfX3B0ZSBhbmQgZ2V0dGluZyBldmVyeXRoaW5nIGVsc2UgZnJvbSBhc20tZ2VuZXJpYywgaXQg
ZGVmaW5lcyAKYSBfX3BtZCB0aGVuIHJlZGVmaW5lcyB0aGUgZm9sZGVkIGxldmVscyBsaWtlIHRo
ZSBwdWQsIGV0YyAuLi4KClRoYXQncyBleGFjdGx5IHdoYXQgdGhlIGNoZWNrZXIgYWltcyBhdCBk
ZXRlY3Rpbmc6IGFyY2hpdGVjdHVyZXMgdGhhbiBkbyAKbm90IHByb3Blcmx5IHVzZSB0aGUgc3Rh
bmRhcmQgbGludXggcGFnZSB0YWJsZSBzdHJ1Y3R1cmVzLgoKQ2hyaXN0b3BoZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFp
bGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
