Return-Path: <SRS0=mK5U=3W=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D77AC35240
	for <linux-snps-arc@archiver.kernel.org>; Sun,  2 Feb 2020 08:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61899206E6
	for <linux-snps-arc@archiver.kernel.org>; Sun,  2 Feb 2020 08:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tHR5TRfg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="jxSd4bcB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61899206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z90rTQePRSro6d+2Rs3Ylnf/o3c0EYYuqbLWXdHGHm4=; b=tHR5TRfgavS0Ld4auTudrEUUW
	BRbjiiX29wsiI+pZRChYZM8aDH3UMfPP6YKy2kjueSjtEXockuX5C2KP3/uh79mkOSe/3p5jQWqeb
	WAlODtQW+ZOrCa2iZKUrQfF4holMSOV+QQB9OwnowY0bqfMtsbwOFOVjmq1eJA8ZiJNuvRvnBnRgF
	rYuOr07wA390nWNm7Xv84bP89neAlqbp2ZkpAUO84PVt2MPaxMxee12+NHAFiLmRpnTiRD95tf9LM
	P/olIid2EKiPslx4S8P8X2GtXIZrngneLYINrfmFQobwYMyMsJCpTNelxCHQsN5PrfnnYFStlj3Y1
	dzL6wP+aA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyAfS-00082k-35; Sun, 02 Feb 2020 08:31:46 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyAfI-0007uZ-Sp; Sun, 02 Feb 2020 08:31:38 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 489PLc2Pfyz9tyWF;
 Sun,  2 Feb 2020 09:31:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jxSd4bcB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0yWRy2TLi9QC; Sun,  2 Feb 2020 09:31:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 489PLc0zVpz9tyWB;
 Sun,  2 Feb 2020 09:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580632280; bh=gJ+YBiU1siNA6yw0ERrSRXytsUyJ6J4mmY1g8irtvMg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jxSd4bcBMPwDDkQQtltYvbDM7RjmY7wn3YHePmJyrQoSpGxb+srr+7WWVT07acbk4
 Gd8wx/ElVf48v1NQ7kacblPWNxOSr0bIjH1lQW4QiWnAuYKH9BZIwizDmpyvIglx32
 bf4U9cZQC+HCcZh0MgO0YttEmPTxX2H/LjarVNYo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E45E88B762;
 Sun,  2 Feb 2020 09:31:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wqc16BLAbHuO; Sun,  2 Feb 2020 09:31:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A80498B752;
 Sun,  2 Feb 2020 09:31:20 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
 <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
 <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
 <ad5ad414-3524-2efa-df16-1ee357e6e2e4@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e1e046d7-bf1d-eaec-1d0b-fe056b83b84c@c-s.fr>
Date: Sun, 2 Feb 2020 09:31:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ad5ad414-3524-2efa-df16-1ee357e6e2e4@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_003137_225559_6413E58A 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAwMi8wMi8yMDIwIMOgIDA4OjE4LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IE9uIDAxLzMwLzIwMjAgMDc6NDMgUE0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Cj4+Cj4+
IExlIDMwLzAxLzIwMjAgw6AgMTQ6MDQsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+
Pgo+Pj4gT24gMDEvMjgvMjAyMCAxMDozNSBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4K
Pj4+Cj4+Pj4gSSB0aGluayB3ZSBjb3VsZCBtYWtlIGl0IHN0YW5kYWxvbmUgYW5kICdkZWZhdWx0
IHkgaWYgREVCVUdfVk0nIGluc3RlYWQuCj4+Pgo+Pj4gV2hpY2ggd2lsbCB5aWVsZCB0aGUgc2Ft
ZSByZXN1bHQgbGlrZSBiZWZvcmUgYnV0IGluIGEgZGlmZmVyZW50IHdheS4gQnV0Cj4+PiB5ZXMs
IHRoaXMgdGVzdCBjb3VsZCBnbyBhYm91dCBlaXRoZXIgd2F5IGJ1dCB1bmxlc3MgdGhlcmUgaXMg
YSBnb29kIGVub3VnaAo+Pj4gcmVhc29uIHdoeSBjaGFuZ2UgdGhlIGN1cnJlbnQgb25lLgo+Pgo+
PiBJIHRoaW5rIGlmIHdlIHdhbnQgcGVvcGxlIHRvIHJlYWxseSB1c2UgaXQgb24gb3RoZXIgYXJj
aGl0ZWN0dXJlcyBpdCBtdXN0IGJlIHBvc3NpYmxlIHRvIGFjdGl2YXRlIGl0IHdpdGhvdXQgaGF2
aW5nIHRvIG1vZGlmeSBLY29uZmlnLiBPdGhlcndpc2UgcGVvcGxlIHdvbid0IGV2ZW4ga25vdyB0
aGUgdGVzdCBleGlzdHMgYW5kIHRoZSBhcmNoaXRlY3R1cmUgZmFpbHMgdGhlIHRlc3QuCj4+Cj4+
IFRoZSBwdXJwb3NlIG9mIGEgdGVzdCBzdWl0ZSBpcyB0byBkZXRlY3QgYnVncy4gSWYgeW91IGNh
bid0IHJ1biB0aGUgdGVzdCB1bnRpbCB5b3UgaGF2ZSBmaXhlZCB0aGUgYnVncywgSSBndWVzcyBu
b2JvZHkgd2lsbCBldmVyIGRldGVjdCB0aGUgYnVncyBhbmQgdGhleSB3aWxsIG5ldmVyIGJlIGZp
eGVkLgo+Pgo+PiBTbyBJIHRoaW5rOgo+PiAtIHRoZSB0ZXN0IHNob3VsZCBiZSAnZGVmYXVsdCB5
JyB3aGVuIEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUgaXMgc2VsZWN0ZWQKPj4gLSB0aGUgdGVz
dCBzaG91bGQgYmUgJ2RlZmF1bHQgbicgd2hlbiBBUkNIX0hBU19ERUJVR19WTV9QR1RBQkxFIGlz
IG5vdCBzZWxlY3RlZCwgYW5kIGl0IHNob3VsZCBiZSB1c2VyIHNlbGVjdGFibGUgaWYgRVhQRVJU
IGlzIHNlbGVjdGVkLgo+Pgo+PiBTb21ldGhpbmcgbGlrZToKPj4KPj4gY29uZmlnIERFQlVHX1ZN
X1BHVEFCTEUKPj4gIMKgwqDCoCBib29sICJEZWJ1ZyBhcmNoIHBhZ2UgdGFibGUgZm9yIHNlbWFu
dGljcyBjb21wbGlhbmNlIiBpZiBBUkNIX0hBU19ERUJVR19WTV9QR1RBQkxFIHx8IEVYUEVSVAo+
PiAgwqDCoMKgIGRlcGVuZHMgb24gTU1VCj4gCj4gKEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUg
fHwgRVhQRVJUKSBiZSBtb3ZlZCBhbG9uZyBzaWRlIE1NVSBvbiB0aGUgc2FtZSBsaW5lID8KClll
cyBjb3VsZCBhbHNvIGdvIGFsb25nIHNpZGUgTU1VLCBvciBjb3VsZCBiZSBhIGRlcGVuZCBieSBp
dHNlbGY6CglkZXBlbmRzIG9uIEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUgfHwgRVhQRVJUCgo+
IAo+PiAgwqDCoMKgIGRlZmF1bHQgJ24nIGlmICFBUkNIX0hBU19ERUJVR19WTV9QR1RBQkxFCj4+
ICDCoMKgwqAgZGVmYXVsdCAneScgaWYgREVCVUdfVk0KPiAKPiBUaGlzIGxvb2tzIGdvb2QsIGF0
IGxlYXN0IHVudGlsIHdlIGdldCBhbGwgcGxhdGZvcm1zIGVuYWJsZWQuIFdpbGwgZG8gYWxsIHRo
ZXNlCj4gY2hhbmdlcyBhbG9uZyB3aXRoIHMzOTAgZW5hYmxlbWVudCBhbmQgcmUtc3Bpbi4KCkNo
cmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
