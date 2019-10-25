Return-Path: <SRS0=Dz6H=YS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9C5CA9EA0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Oct 2019 07:11:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C4021929
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Oct 2019 07:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FX42KYmU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="JS6Rw9Wo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C4021929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OyPYYB2FbENnR6vHNQt3thv+i6/Ut46jrFcj8XgbiJs=; b=FX42KYmUyECyDUHwoTKYancV8
	k4NnSYIUoDvS0yGbjufbdoo8sNi7APPX80LasvpbO44R2MlGYRbvzrTUOYj8B2FR0yBYz4vBeBugU
	u331MAuk7ZZGlMNPvlegrFkkkxU7VgahcdhB37vPauG1/TDi1m/uVBCGFNbhvFTd8nRzft+B8YDZZ
	46fG5EuNJACYfCL817yYS2kOWa13hqt9vr0EBUwl2XTkPUg9/SR1reHvNOV72QJsd14+SUiXz6yKW
	EmRZuSkCWhLz8XADyz7c89LZkmnmrQH99Kb/dyE6XWs8w1NiDtKX51eWK1trHTT6qkNRi8YlfLqP+
	DlXo69fww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNtl8-0007rz-DF; Fri, 25 Oct 2019 07:11:42 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNtkw-0007hY-G2; Fri, 25 Oct 2019 07:11:32 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46zwJL1km6z9txyl;
 Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=JS6Rw9Wo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IEyuu55Vu2Vj; Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46zwJL044Jz9txyd;
 Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571987474; bh=sSY9vZFiyvVRvxrTbg3cBY9vh4bHCPcOU8OggoNJn50=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JS6Rw9Woz5UGQqHdTS6uzWgmc4CU/P/yOx+M2iQQgUsIUyeQU6CEy1rN1WbGM/gMX
 jg5kH3n063w2jEkgx41+z8O5phWdZyM3jwWcRyaHHpi22TkWJphSF18ZBHt9X26ALg
 0sa7mSxQ44NMG02wKJaVu3L7vo7n7mt0UVXaQK8I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF5238B7C7;
 Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NUWV8rK7Wu_n; Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D5FF28B7BE;
 Fri, 25 Oct 2019 09:11:12 +0200 (CEST)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table
 helpers
To: Qian Cai <cai@lca.pw>, Anshuman Khandual <Anshuman.Khandual@arm.com>
References: <ccdd4f7a-c7dc-ca10-d30c-0bc05c7136c7@arm.com>
 <69256008-2235-4AF1-A3BA-0146C82CCB93@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3cfec421-4006-4159-ca32-313ff5196ff9@c-s.fr>
Date: Fri, 25 Oct 2019 09:11:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <69256008-2235-4AF1-A3BA-0146C82CCB93@lca.pw>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_001130_831964_7EC5994F 
X-CRM114-Status: GOOD (  12.64  )
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
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
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
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAyNS8xMC8yMDE5IMOgIDA3OjUyLCBRaWFuIENhaSBhIMOpY3JpdMKgOgo+IAo+IAo+PiBP
biBPY3QgMjQsIDIwMTksIGF0IDExOjQ1IFBNLCBBbnNodW1hbiBLaGFuZHVhbCA8QW5zaHVtYW4u
S2hhbmR1YWxAYXJtLmNvbT4gd3JvdGU6Cj4+Cj4+IE5vdGhpbmcgc3BlY2lmaWMuIEJ1dCBqdXN0
IHRlc3RlZCB0aGlzIHdpdGggeDg2IGRlZmNvbmZpZyB3aXRoIHJlbGV2YW50IGNvbmZpZ3MKPj4g
d2hpY2ggYXJlIHJlcXVpcmVkIGZvciB0aGlzIHRlc3QuIE5vdCBzdXJlIGlmIGl0IGludm9sdmVk
IFc9MS4KPiAKPiBObywgaXQgd2lsbCBub3QuIEl0IG5lZWRzIHRvIHJ1biBsaWtlLAo+IAo+IG1h
a2UgVz0xIC1qIDY0IDI+L3RtcC93YXJucwo+IAoKQXJlIHdlIHRhbGtpbmcgYWJvdXQgdGhpcyBw
ZWFjZSBvZiBjb2RlID8KCitzdGF0aWMgdW5zaWduZWQgbG9uZyBfX2luaXQgZ2V0X3JhbmRvbV92
YWRkcih2b2lkKQoreworCXVuc2lnbmVkIGxvbmcgcmFuZG9tX3ZhZGRyLCByYW5kb21fcGFnZXMs
IHRvdGFsX3VzZXJfcGFnZXM7CisKKwl0b3RhbF91c2VyX3BhZ2VzID0gKFRBU0tfU0laRSAtIEZJ
UlNUX1VTRVJfQUREUkVTUykgLyBQQUdFX1NJWkU7CisKKwlyYW5kb21fcGFnZXMgPSBnZXRfcmFu
ZG9tX2xvbmcoKSAlIHRvdGFsX3VzZXJfcGFnZXM7CisJcmFuZG9tX3ZhZGRyID0gRklSU1RfVVNF
Ul9BRERSRVNTICsgcmFuZG9tX3BhZ2VzICogUEFHRV9TSVpFOworCisJV0FSTl9PTigocmFuZG9t
X3ZhZGRyID4gVEFTS19TSVpFKSB8fAorCQkocmFuZG9tX3ZhZGRyIDwgRklSU1RfVVNFUl9BRERS
RVNTKSk7CisJcmV0dXJuIHJhbmRvbV92YWRkcjsKK30KKwoKcmFtZG9tX3ZhZGRyIGlzIHVuc2ln
bmVkLApyYW5kb21fcGFnZXMgaXMgdW5zaWduZWQgYW5kIGxvd2VyIHRoYW4gdG90YWxfdXNlcl9w
YWdlcwoKU28gdGhlIG1heCB2YWx1ZSByYW5kb21fdmFkZHIgY2FuIGdldCBpcyBGSVJTVF9VU0VS
X0FERFJFU1MgKyAKKChUQVNLX1NJWkUgLSBGSVJTVF9VU0VSX0FERFJFU1MgLSAxKSAvIFBBR0Vf
U0laRSkgKiBQQUdFX1NJWkUgPSAKVEFTS19TSVpFIC0gMQpBbmQgdGhlIG1pbiB2YWx1ZSByYW5k
b21fdmFkZHIgY2FuIGdldCBpcyBGSVJTVF9VU0VSX0FERFJFU1MgKHRoYXQncyAKd2hlbiByYW5k
b21fcGFnZXMgPSAwKQoKU28gdGhlIFdBUk5fT04oKSBpcyBqdXN0IHVubmVlZGVkLCBpc24ndCBp
dCA/CgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
