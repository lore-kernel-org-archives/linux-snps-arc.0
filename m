Return-Path: <SRS0=yyJz=37=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBF8C35242
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Feb 2020 05:34:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40F720714
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Feb 2020 05:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tCiPbr+9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="eiJDqafS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40F720714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tGLqOl/JfgEgXybnFPr1bo/bAUMIiPYHiRqzouKhJF0=; b=tCiPbr+9P8/j5qSYnC8JZTGXe
	sTCbBcaY6rJ5+HXZm9vUIk1MwDiE1uNYIq6M1bMfWELJHeUFlh/NcTvzqDftqzJDM6Zj0cnv7ZChp
	+3Slzz04JotIZ8XM/r05la7MZQ0OT+ITnUe8QWi2jD4KFG5Mdwx09tl/HJc9uDc+FS0RMtENy5tiV
	aKTG/PO/icriv4s9vb39Jtc7N1akpOPpCfX1p97wogLT13Nf5fXbDQTkjbsgTcGFBFwSm3k++aYXV
	F1lRDrlLrraiAFqPy30mo0CJOI14DOiMO8wuQ9riavkvUXzAOWOpHqVuo5vNfFEpFcGYqXCymKkSC
	yedSK5mSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1OBO-0004JD-Um; Tue, 11 Feb 2020 05:34:02 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1OBK-0004HU-MT; Tue, 11 Feb 2020 05:34:00 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Grzf3xCbz9v3Zl;
 Tue, 11 Feb 2020 06:33:50 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eiJDqafS; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zkhy9QdmXM9w; Tue, 11 Feb 2020 06:33:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Grzf2Rpnz9v3ZZ;
 Tue, 11 Feb 2020 06:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581399230; bh=Mwmnj2Mh3WwfnwZCWtQm8v+ZNM5AU+v+3fKB+Vt+2i0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eiJDqafSfDYphjROC10Vnz8Xn4zZIPklngVdYVaguBX5QmUxSbROO5kAJ30wvAhzg
 0fV39U/k7ykq9c6fVHRsjt4aiC/Qv+CenzoBQFemfXJIaflYEGRvsm8/278XrXInkJ
 zdjMm7FlftlG1Bdd/ww1KQhN8+LUDsKmilPkcQWI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 112868B787;
 Tue, 11 Feb 2020 06:33:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fAOO4UrrOOMa; Tue, 11 Feb 2020 06:33:50 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D691D8B776;
 Tue, 11 Feb 2020 06:33:47 +0100 (CET)
Subject: Re: [PATCH V13] mm/debug: Add tests validating architecture page
 table helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <1580897674-16456-1-git-send-email-anshuman.khandual@arm.com>
 <202002060619.wEOdAZU1%lkp@intel.com>
 <78d3ce6b-e100-2561-6b09-124c29731d1a@arm.com>
 <20200209205231.44d098f8749e88190b8ba10c@linux-foundation.org>
 <955229f7-f161-f720-0e75-a3163f63817d@arm.com>
 <aef1048f-68c4-d14f-e669-8f288ba9ac7a@c-s.fr>
 <20200210100200.GB25745@shell.armlinux.org.uk>
 <7cb3a5bb-eaea-a01c-4047-e3c000b7ad1d@c-s.fr>
 <20200210110639.GC25745@shell.armlinux.org.uk>
 <82317d50-57a2-ce84-7557-21635d57448e@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <aa540cd6-93a0-1be4-cdff-c9af43ed7d8e@c-s.fr>
Date: Tue, 11 Feb 2020 06:33:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <82317d50-57a2-ce84-7557-21635d57448e@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_213359_032215_4C55D186 
X-CRM114-Status: GOOD (  14.27  )
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
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 kbuild test robot <lkp@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Matthew Wilcox <willy@infradead.org>,
 Steven Price <Steven.Price@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>,
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
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

CgpMZSAxMS8wMi8yMDIwIMOgIDAzOjI1LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IAo+IAo+IE9uIDAyLzEwLzIwMjAgMDQ6MzYgUE0sIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBh
ZG1pbiB3cm90ZToKPj4gVGhlcmUgYXJlIGdvb2QgcmVhc29ucyBmb3IgdGhlIHdheSBBUk0gZG9l
cyBzdHVmZi4gIFRoZSBnZW5lcmljIGNyYXAgd2FzCj4+IHdyaXR0ZW4gd2l0aG91dCByZWdhcmQg
Zm9yIHRoZSBjaXJjdW1zdGFuY2VzIHRoYXQgQVJNIGhhcywgYW5kIHRodXMgaXMKPj4gZW50aXJl
bHkgdW5zdWl0YWJsZSBmb3IgMzItYml0IEFSTS4KPiAKPiBTaW5jZSB3ZSBkb250IGhhdmUgYW4g
YWdyZWVtZW50IGhlcmUsIGxldHMganVzdCBzZXR0bGUgd2l0aCBkaXNhYmxpbmcgdGhlCj4gdGVz
dCBmb3Igbm93IG9uIHBsYXRmb3JtcyB3aGVyZSB0aGUgYnVpbGQgZmFpbHMuIENPTkZJR19FWFBF
UlQgaXMgZW5hYmxpbmcKPiB0aGlzIHRlc3QgZm9yIGJldHRlciBhZGFwdGFiaWxpdHkgYW5kIGNv
dmVyYWdlLCBoZW5jZSBob3cgYWJvdXQgcmUgZnJhbWluZwo+IHRoZSBjb25maWcgbGlrZSB0aGlz
ID8gVGhpcyBhdCB0aGUgbGVhc3QgY29udmV5cyB0aGUgZmFjdCB0aGF0IEVYUEVSVCBvbmx5Cj4g
d29ya3Mgd2hlbiBwbGF0Zm9ybSBpcyBuZWl0aGVyIElBNjQgb3IgQVJNLgoKQWdyZWVkCgo+IAo+
IGNvbmZpZyBERUJVR19WTV9QR1RBQkxFCj4gCWJvb2wgIkRlYnVnIGFyY2ggcGFnZSB0YWJsZSBm
b3Igc2VtYW50aWNzIGNvbXBsaWFuY2UiCj4gCWRlcGVuZHMgb24gTU1VCj4gCWRlcGVuZHMgb24g
QVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRSB8fCAoRVhQRVJUICYmICAhKElBNjQgfHwgQVJNKSkK
CkkgdGhpbmsgaXQncyBtYXliZSBiZXR0ZXIgdG8gaGF2ZSBhIGRlZGljYXRlZCBkZXBlbmRzIGxp
bmU6CgpkZXBlbmRzIG9uICFJQTY0ICYmICFBUk0KZGVwZW5kcyBvbiBBUkNIX0hBU19ERUJVR19W
TV9QR1RBQkxFIHx8IEVYUEVSVAoKVGhlIGRheSBhcm0gYW5kL29yIGlhNjQgaXMgcmVhZHkgZm9y
IGJ1aWxkaW5nIHRoZSB0ZXN0LCB3ZSBjYW4gcmVtb3ZlIAp0aGF0IGRlcGVuZHMuCgo+IAlkZWZh
dWx0IG4gaWYgIUFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUKPiAJZGVmYXVsdCB5IGlmIERFQlVH
X1ZNCj4gCgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXNucHMtYXJjCg==
