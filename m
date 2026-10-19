Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97564CCF2E3
	for <linux-snps-arc@archiver.kernel.org>; Mon, 19 Oct 2026 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IzfHHWBsFDBmlYH/KpYUUBWklTFyPQji3kR94boS8Q=; b=sP8j9KPc+TESKi
	PCrG7nZxAi4cUgjO3Zb3aLFHvrohyvI+8iIrYJtvfcmxEAAIFxfwxw9/sEDQqtbJNZvnovign1cve
	zh8QquR3s3Dhq/qFHxJgR2CyijIUPj4Wt6qHQt5eDtMDLb4SOJQsOK2XJP9k8cuG1g1rSKVuz401+
	eZXP6+7RmmKH3OvlhPF9E65B/q97kmLYQsUs76kSJiQUbKz8/Ooll5u7CsYlLTShaCzknyIBDfw5F
	dthqa25ohIFLQCiTcPrA9BaqN368M9ZNAcvG4e8hdwq4elXaj0Jb9nHZGFSeokY0HpZC3UfQBQKUS
	0W86p4bTkk8hCjXv3iZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoRq-00000007kYg-0E7x;
	Mon, 19 Oct 2026 14:34:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoRp-00000007kYI-1v7P
	for linux-snps-arc@lists.infradead.org;
	Mon, 19 Oct 2026 14:34:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9507F60136;
	Mon, 19 Oct 2026 14:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715E11F000C4;
	Mon, 19 Oct 2026 14:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420484;
	bh=mOXe4LQGts3ArD2pw3xFg+XnFDQf4F0VIInax9HK9h4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P0dOdEVKyjVx5vtpkFSVJWNshcCTE0EM/gbdejGiGHRqXaYTe3X1uN3UJr+BKMX48
	 2eHu5giELY/4A14GKat0gGAE3R0C6jbo2LdCFj9ZvXnv0SC8txuPAIgAO0mIz5hvt0
	 oOwmDK3ZwdVOEXoc/1Rn+bAsYQuYHCu2HvILVZiy1yG2ohZpR5NoKcBfmRubVRR+UR
	 eIeg+TLJuVavVoZB7b59YeW2YNv5UPtWVJXf2fPp8nfRw58lAIk8qV57Vik5SqluEv
	 NunTcMsjvbCfebyTOSLRGcKIqtIPNV1rbP9SqPrP2MMkL6r51PLf566pq/Pq2epv8v
	 WLmgqxdhHSmhQ==
Message-ID: <c32b7ed2-fa3f-4a58-9300-21efcc88f056@kernel.org>
Date: Mon, 19 Oct 2026 09:34:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nios2: ksyms: Declare __mulsi3 export
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 Ley Foon Tan <lftan@altera.com>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
References: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
 <47eb6b48-d664-440f-84b6-ba09f34d5e08@app.fastmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <47eb6b48-d664-440f-84b6-ba09f34d5e08@app.fastmail.com>
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

CgpPbiAxMC8xOS8yNiAwNjoxNiwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBNb24sIE9jdCAx
OSwgMjAyNiwgYXQgMTE6NDksIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+PiBHQ0MgbWF5IGVt
aXQgbGliY2FsbHMgdG8gX19tdWxzaTMoKS4gQXMgbW9kcG9zdCBpcyBub3QgYXdhcmUgdGhhdCB0
aGlzCj4+IGZ1bmN0aW9uIGlzIHByb3ZpZGVkIHRocm91Z2ggdGhlIGxpbmtlZCBpbiBsaWJnY2Ms
IGl0IGZhaWxzOgo+Pgo+PiBFUlJPUjogbW9kcG9zdDoga2VybmVsL2xvY2tpbmcvdGVzdC13d19t
dXRleC5rbzogc3ltYm9sICdfX211bHNpMycgdW5kZWZpbmVkIQo+PiBFUlJPUjogbW9kcG9zdDog
a2VybmVsL3RpbWUvdGVzdF91ZGVsYXkua286IHN5bWJvbCAnX19tdWxzaTMnIHVuZGVmaW5lZCEK
Pj4gRVJST1I6IG1vZHBvc3Q6IGtlcm5lbC9yZXNvdXJjZV9rdW5pdC5rbzogc3ltYm9sICdfX211
bHNpMycgdW5kZWZpbmVkIQo+PiBFUlJPUjogbW9kcG9zdDogZnMvZnVzZS92aXJ0aW9mcy5rbzog
c3ltYm9sICdfX211bHNpMycgdW5kZWZpbmVkIQo+PiBldGMuCj4+Cj4+IE1ha2Ugc3VyZSBtb2Rw
b3N0IGNhbiBzZWUgdGhlIHN5bWJvbCBmcm9tIGxpYmdjYy4KPj4KPj4gUmVwb3J0ZWQtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiBDbG9zZXM6Cj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjEwMTcxOTMzLko0YkZPZkw4LWxrcEBpbnRl
bC5jb20vCj4+IEZpeGVzOiAyZmM4NDgzZmRjZGUgKCJuaW9zMjogQnVpbGQgaW5mcmFzdHJ1Y3R1
cmUiKQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZT4KPiAKPiBBY2tlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KPiAKPiBUaGUgcGF0Y2ggbG9va3MgY29ycmVjdCB0byBtZSwgYnV0IGl0IHdvdWxkIGFs
c28gYmUgbmljZSB0byBub3QgdXNlCj4gbGliZ2NjIGF0IGFsbC4gV2hhdCBJIHNlZSBpcyB0aGF0
IG9ubHkgYXJjLCBuaW9zMiwgb3BlbnJpc2MgYW5kCj4gcGFyaXNjIHN0aWxsIGxpbmsgYWdhaW5z
dCB0aGUgdG9vbGNoYWluLXByb3ZpZGVkIGxpYmdjYywgZXZlcnl0aGluZwo+IGVsc2UgdXNlcyB0
aGUga2VybmVsJ3Mgb3duIHJ1bnRpbWUuCj4gCj4gSXQncyBwcm9iYWJseSBub3QgZXZlbiB0aGF0
IGhhcmQgdG8gZG8gcmlnaHQsIGhlcmUgaXMgd2hhdCBJIGZvdW5kCj4gaXMgaW1wb3J0ZWQgZnJv
bSBsaWJnY2MuCj4gClBhdGNoIGFwcGxpZWQhCgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uIEFy
bmQsIEknbGwgd29yayB0byBvbiB0aGUgTklPUzIuCgpEaW5oCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QK
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
