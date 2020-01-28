Return-Path: <SRS0=i8W8=3R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB75C33CB3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 07:04:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B00F2173E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 07:04:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IMfR9pQw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B00F2173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBPs8SvWXQgmV0CWEAI7wpkKnfG/97ygMff7NGfJAXA=; b=IMfR9pQwkiY39c
	xsP/645UseWdfjN2vrhCzfffCyV1sr2vo3iiGSgnP4w5iTopH0kwpQi6MQRW4P5sy0EKhoBvpzrW1
	tX02xvaKTXTP4xybbhP+cvH8azveYo9eBUFkXGuMjmk4CM3VlSvYh5qr6WcOj/OKhzCnsjnYImBLV
	Tq0BPpOcD2YVxHZLwZOp1E8e2WvB48xVep+iTiGtnJzVWUHYgsu+TCA9KbhuonxLF3jOds8d2LiLG
	7909qJk2mbMTP4Jv7bN0RgyxlpWxEHS9jv4xE5LJBIQRJ+mZc57PahTqzPbkj1x//bigMKm9QyVDq
	UExqwOOCGwayNvz0t4VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwKv3-00062E-2o; Tue, 28 Jan 2020 07:04:17 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwKuo-0005rw-Qp; Tue, 28 Jan 2020 07:04:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2F6331B;
 Mon, 27 Jan 2020 23:03:58 -0800 (PST)
Received: from [10.163.1.151] (unknown [10.163.1.151])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A5A43F67D;
 Mon, 27 Jan 2020 23:07:21 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>, Christophe Leroy <christophe.leroy@c-s.fr>
References: <115c187b-73ce-30b2-0694-999db1f2183b@c-s.fr>
 <F90DA0AA-4D27-4346-8D8D-D9A7871E2C07@lca.pw>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <ba5a836a-b594-f846-1734-71dcd5d089e6@arm.com>
Date: Tue, 28 Jan 2020 12:33:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <F90DA0AA-4D27-4346-8D8D-D9A7871E2C07@lca.pw>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_230402_914257_B0923EEC 
X-CRM114-Status: GOOD (  13.11  )
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
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
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

CgpPbiAwMS8yOC8yMDIwIDEyOjA2IFBNLCBRaWFuIENhaSB3cm90ZToKPiAKPiAKPj4gT24gSmFu
IDI4LCAyMDIwLCBhdCAxOjE3IEFNLCBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGMtcy5mcj4gd3JvdGU6Cj4+Cj4+IEl0IGlzICdkZWZhdWx0IHknIHNvIHRoZXJlIGlzIG5vIG11
Y2ggcmlzayB0aGF0IGl0IGlzIGZvcmdvdHRlbiwgYXQgbGVhc3QgYWxsIHRlc3Qgc3VpdGVzIHJ1
biB3aXRoICdhbGx5ZXNfZGVmY29uZmlnJyB3aWxsIHRyaWdnZXIgdGhlIHRlc3QsIHNvIEkgdGhp
bmsgaXQgaXMgcmVhbGx5IGEgZ29vZCBmZWF0dXJlLgo+IAo+IFRoaXMgdGhpbmcgZGVwZW5kcyBv
biBERUJVR19WTSB3aGljaCBJIGRvbuKAmXQgc2VlIGl0IGlzIHNlbGVjdGVkIGJ5IGFueSBkZWZj
b25maWcuIEFtIEkgbWlzc2luZyBhbnl0aGluZz8KPiAKCidhbGx5ZXNjb25maWcnIG1ha2VzICdE
RUJVR19WTSA9IHknIHdoaWNoIGluIHR1cm4gd2lsbCBlbmFibGUgJ0RFQlVHX1ZNX1BHVEFCTEUg
PSB5JwpvbiBwbGF0Zm9ybXMgdGhhdCBzdWJzY3JpYmUgQVJDSF9IQVNfREVCVUdfVk1fUEdUQUJM
RS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
