Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F160CCA5FFF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3nh9EoQgIvUPy0ct9Y2ayELAmY3CcFk4ZIlXANkw0o=; b=XJ+K1HrV/1PexN
	R4V1wuI4roqNkLO8uafOOh5Gzsh7ixpQSmMGlzZDqfVgFqaX9YwSh6uGjxL7/9kgBu7yXkrC/IAL7
	ih6h2LpdgiludP4xTq4YHFbMgLT469SRmilz3ALH0EA32fr74Fe8uaRW/0TXcUtitpdQ/ow41xEzj
	zzCOJx5s8Kqn84lkIiwKp6vjx4lzg5+IthjIZ85qrJ7x1as7iiKEDFw5LGJYKT2l5pC68yMtXtYop
	oexCmQtg8yNuhxkF5w5kyjJWIIHuTTE329tGowMkRdbADj1vDvU2jyiaQVX/TCf6UeQzyVa01hc6+
	Qnvx8aZFofG/pT4/ZzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMym-00000001wNV-3992;
	Wed, 07 Oct 2026 08:26:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyj-00000001wMp-1iMf
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF05B416B0;
	Wed,  7 Oct 2026 08:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF821F0089B;
	Wed,  7 Oct 2026 08:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791361580;
	bh=hlUZCHfbuJBYU16iQy8H6PXle9Q4Ze/1tSWfJ/Y+zdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OmrkYRjy0QQ1IyzAAdn77k4jJ/VV9aUhwixFkBj+g1pAyp60O2kty5Qwyzfm4S3Gh
	 20fPdkEBpbjyajPgMJ9z07fpqM5aJGZK/vwbljoJOccUprgE1mPdrjIXJcoXRL+fPY
	 0lSV1wvoF/PcLD47jui8v+7oX+ClaW0IqjUazTI9amREodX1tiHEJzvSqBppDCuD++
	 ySopvILlww2B2PwayUF0KskHYyVi8Q1I3EINJHuGl3w1itbSOTwh/z1LU5GJBahvQd
	 7pZXa0DulB/CK1vfsfqCSnXqrtvCphm98O8ztjT5FaigVWS20DQe5B6HxDbDvZxZxs
	 mTVbDS2/O8enw==
Message-ID: <1634a670-eeb4-4e74-a861-c7f54642ae63@kernel.org>
Date: Wed, 7 Oct 2026 10:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
To: Bradley Morgan <brads@mainlining.org>, paulmck@kernel.org,
 kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com, oe-kbuild-all@lists.linux.dev,
 arnd@arndb.de, david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
 ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005120700.383058-4-brads@mainlining.org>
 <202610061704.rvbolgPy-lkp@intel.com>
 <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
 <543B9D97-52F8-4D12-8118-9698F6908668@mainlining.org>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <543B9D97-52F8-4D12-8118-9698F6908668@mainlining.org>
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

T24gMTAvNi8yNiAxNzo0NiwgQnJhZGxleSBNb3JnYW4gd3JvdGU6Cj4gRG8geW91IHJlY2tvbiB0
aGV5IGFyZSBmaW5lIHRvIHlvdT8gVGhlIHBhdGNoZXM/Cj4KPiBBcmNoIG1haW50YWluZXJzIG1h
eSBiZSBidXN5IHVuZm9ydHVuYXRlbHkg8J+ZgSwgSSd2ZSBkb25lIHRlc3Rpbmcgb24gYWxsCj4g
dGhlIGFyY2hlcywKCkV2ZXJ5b25lIGlzIHRyYXZlbGluZyBkdWUgdG8gdGhlIGNvbmYgc2Vhc29u
IC0gTFBDLCBFTEMuCgotVmluZWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
