Return-Path: <SRS0=oU4o=3X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B88FC35247
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Feb 2020 15:48:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF8C2082E
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Feb 2020 15:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmqqFQCd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="kUu9P+c9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CF8C2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASUYWhnlmRBDoaB2gCUIBxdPA7N1uIGivMv8HuO8ZiA=; b=fmqqFQCdLjIolY
	CoGdxWN5zvs8uvD/wQLsISr+PThnBRcw4ETxpUxtH1BbCHJPjq/ZVWfiq1lYXl53dDbKhTzHVIbl+
	rxhUBA9Ve8zML1wrnnYCc0DgkHs/mw5BAcGT9qNEKg4XKJF3OEMAptBMGqKVah7oO33qS7/JKFFY/
	Yg3qYq3beGRi4UnShknSfC4tyVMR933CYZczPanSM15aAkTpCtGvlJrHYixteZh+pWAWZKUKS/UI+
	mbHTZx1rSOO7thnNQ4XerPpJebcAWSjkjaeyOkzVHSWgUJx3Ba+F9dPNe73TB+k8szy5h8U/E/U3t
	PRTh3NVjnviFpskhMNrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iydxZ-0001wO-Ck; Mon, 03 Feb 2020 15:48:25 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iydxW-0001rx-K5
 for linux-snps-arc@lists.infradead.org; Mon, 03 Feb 2020 15:48:23 +0000
Received: by mail-qt1-x841.google.com with SMTP id t13so11780685qto.3
 for <linux-snps-arc@lists.infradead.org>; Mon, 03 Feb 2020 07:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YNMOJs1FPm/l462+AObUcJBpy8J/6Ie1z+BZTrXlP78=;
 b=kUu9P+c9Xi/sRwQmUmgRczJtLr5gqK+yFzRIYgulkIKq53mKQTosQf2B1M6rGAi1Vz
 zf6l65bkbMXSBdMvkcorvRBREKJsVTppzgxLeEe94RRQYYE5rTfTkBy5PLm4V1jr5ZQ2
 8/TkMtxS7aFoHnfHuQCreV0p97LuOHmi4sH1PeQhHzRc+prSAziRCba+Efew+79NFeug
 7sAupOPSdzNPuzEGx/PoF+bkDk7yc1blkxEFffDT9NhTb2wE5i6A49kcGqskeWYy690O
 nI+R4iCW7RBwWJK/FMvjoUPLd2pEL4Dy23U+/NizYdlcaK8tA1r3cfCm2lrDynXLFW6Q
 69MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YNMOJs1FPm/l462+AObUcJBpy8J/6Ie1z+BZTrXlP78=;
 b=G+WDV0sWxC9WtqqmxL3V1iUa2evFa/3tMNtVB77B+GPGZ7hfP2VfwSt2OPiTVcyXs/
 EZPkD200TtiFjYpkDovVDZVdn+U6422j+zwkg3p918kP7/HdVBm2s+uNXOgz2hb4p0Bo
 qtBbUi8QACUHPEG1ryCqPU8yTpMAVeq+ccYGD8xP7BmgapnhulSmcqW1XUb53QxTeyJU
 Vlo8hpJJt7Tu8DFRda3Biw6bswz0NTbbtr1jDE9c//1h0BqZwgGsXFEJY+h7G9rqfjVb
 g2Z84EbUw23y76Z0CW/byHJAJddrRlJ5r3UieMwJ0ASq0BDBrFvhd2MA+kqLo+lx4g2I
 k/9A==
X-Gm-Message-State: APjAAAXbmHP1NkRCzG8J6S95T/lj3uUpWvpaRbyfD4t11DDUCVnvFNbR
 ko9rtxnBKb5Fj1USgX9QDb+Fjw==
X-Google-Smtp-Source: APXvYqzzoz8hW5WNsRr+QGAP5pmz1r20ujicRCSbC4RPyZEQg2Pm/930hS/RB0M0ITiwlO80rrs//A==
X-Received: by 2002:ac8:7695:: with SMTP id g21mr22123082qtr.99.1580744899546; 
 Mon, 03 Feb 2020 07:48:19 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id n132sm9814556qke.58.2020.02.03.07.48.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Feb 2020 07:48:18 -0800 (PST)
Message-ID: <1580744894.7365.3.camel@lca.pw>
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Date: Mon, 03 Feb 2020 10:48:14 -0500
In-Reply-To: <8e94a073-4045-89aa-6a3b-24847ad7c858@c-s.fr>
References: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
 <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
 <8e94a073-4045-89aa-6a3b-24847ad7c858@c-s.fr>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_074822_663086_A28FC3B0 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 kasan-dev <kasan-dev@googlegroups.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTAyLTAzIGF0IDE2OjE0ICswMTAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Ogo+IAo+IExlIDAyLzAyLzIwMjAgw6AgMTI6MjYsIFFpYW4gQ2FpIGEgw6ljcml0wqA6Cj4gPiAK
PiA+IAo+ID4gPiBPbiBKYW4gMzAsIDIwMjAsIGF0IDk6MTMgQU0sIENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAYy1zLmZyPiB3cm90ZToKPiA+ID4gCj4gPiA+IGNvbmZpZyBERUJV
R19WTV9QR1RBQkxFCj4gPiA+ICAgICBib29sICJEZWJ1ZyBhcmNoIHBhZ2UgdGFibGUgZm9yIHNl
bWFudGljcyBjb21wbGlhbmNlIiBpZiBBUkNIX0hBU19ERUJVR19WTV9QR1RBQkxFIHx8IEVYUEVS
VAo+ID4gPiAgICAgZGVwZW5kcyBvbiBNTVUKPiA+ID4gICAgIGRlZmF1bHQgJ24nIGlmICFBUkNI
X0hBU19ERUJVR19WTV9QR1RBQkxFCj4gPiA+ICAgICBkZWZhdWx0ICd5JyBpZiBERUJVR19WTQo+
ID4gCj4gPiBEb2VzIGl0IHJlYWxseSBuZWNlc3NhcnkgdG8gcG90ZW50aWFsbHkgZm9yY2UgYWxs
IGJvdHMgdG8gcnVuIHRoaXM/IFN5emJvdCwga2VybmVsIHRlc3Qgcm9ib3QgZXRjPyBEb2VzIGl0
IGV2ZXIgcGF5IG9mZiBmb3IgYWxsIHRoZWlyIG1hY2hpbmUgdGltZXMgdGhlcmU/Cj4gPiAKPiAK
PiBNYWNoaW5lIHRpbWUgPwo+IAo+IE9uIGEgMzIgYml0cyBwb3dlcnBjIHJ1bm5pbmcgYXQgMTMy
IE1IeiwgdGhlIHRlc3RzIHRha2VzIGxlc3MgdGhhbiAxMG1zLiAKPiBJcyBpdCB3b3J0aCB0YWtp
bmcgdGhlIHJpc2sgb2Ygbm90IGRldGVjdGluZyBmYXVsdHMgYnkgbm90IHNlbGVjdGluZyBpdCAK
PiBieSBkZWZhdWx0ID8KClRoZSByaXNrIGlzIHF1aXRlIGxvdyBhcyBDYXRhbGluIG1lbnRpb25l
ZCB0aGlzIHRoaW5nIGlzIG5vdCB0byBkZXRlY3QKcmVncmVzc2lvbnMgYnV0IHJhdGhlciBmb3Ig
YXJjaC9tbSBtYWludGFpbmVycy4KCkkgZG8gYXBwcmVjaWF0ZSB0aGUgZWZmb3J0cyB0byBnZXQg
ZXZlcnlvbmUgYXMgcG9zc2libGUgdG8gcnVuIHRoaXMgdGhpbmcsCnNvIGl0IGdldCBtb3JlIG5v
dGljZXMgb25jZSBpdCBpcyBicm9rZW4uIEhvd2V2ZXIsIERFQlVHX1ZNIHNlZW1zIGxpa2Ugc3Vj
aAphIGdlbmVyaWMgS2NvbmZpZyB0aG9zZSBkYXlzIHRoYXQgaGF2ZSBldmVuIGJlZW4gZW5hYmxl
ZCBieSBkZWZhdWx0IGZvcgpGZWRvcmEgTGludXgsIHNvIEkgd291bGQgcmF0aGVyIHNlZSBhIG1v
cmUgc2Vuc2l0aXZlIGRlZmF1bHQgYmVlbiB0YWtlbgpldmVuIHRob3VnaCB0aGUgdGVzdCBydW50
aW1lIGlzIGZhaXJseSBxdWlja2x5IG9uIGEgc21hbGwgbWFjaGluZSBmb3Igbm93LgoKPiAKPiBb
ICAgIDUuNjU2OTE2XSBkZWJ1Z192bV9wZ3RhYmxlOiBkZWJ1Z192bV9wZ3RhYmxlOiBWYWxpZGF0
aW5nIAo+IGFyY2hpdGVjdHVyZSBwYWdlIHRhYmxlIGhlbHBlcnMKPiBbICAgIDUuNjY1NjYxXSBk
ZWJ1Z192bV9wZ3RhYmxlOiBkZWJ1Z192bV9wZ3RhYmxlOiBWYWxpZGF0ZWQgCj4gYXJjaGl0ZWN0
dXJlIHBhZ2UgdGFibGUgaGVscGVycwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
