Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2BCC4332F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Nov 2022 09:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MEYLqzPTvQprpiLLJa/pkOBg3VWMsUT7NPdc1077d4=; b=xwZma4FVd9YV30
	mYpq0jTTnUZunhoSwn24Gld/72pvmGenM2MoF3/2zJwyX/iSGl8f8UZOA6Zx2kBMm5gcC1vXtgLyZ
	QmFvl4D/SACj3kEhMQHjMIzdP7kvVJid+J+4mcWUJjHAbumiDgUHfMBVPQ7K2NP7L0l/kdiGiPs6C
	vYglQaOI/Vc0ZatK2onWt4cr1TUF7OTtsNPqNYkKXwv/k6nDzX9ShRB8MDFmaF4H3L9a2U+2D3DAH
	YBClWrbf3Anvcv8w6ybnRF6AkOWJVpKpF8etAbaI1Y5STmasE+3fwB+L4cNWX3h7jamlh69B/5ov2
	L8kjUhzDITOa4kzad4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKYf-003xDO-32; Tue, 08 Nov 2022 09:06:13 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKYd-003xD4-B7
	for linux-snps-arc@lists.infradead.org; Tue, 08 Nov 2022 09:06:12 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id AAD2882703; Tue,  8 Nov 2022 09:06:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1667898368; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=ItpPvFEaaAb/eltV2dE31Q/IcIFWAV/1XjOPeXrK2CQ5/mHAPhQIUcYNR4FLT9YLQ
	 MVTCAPC45CFWLM5lRC0aav3ol0/5n+8bKpQuHkcBoHg/793BfiJFQbclRjOWjEO5Sw
	 0yCDS5cQfTisaJ9qbnIlzjQMPvCD0gMN/HGTppCD/A7zITY2nL5Sni61nwF06QfYyz
	 /wWi+k1vDn+Kqmzo2v4qEy/MnzgrlhSoAsA3zblMezNMglLoqB9+xJWKc7Unbl35P5
	 R1imEovSkTMwfJ6CwEAiWcVNdzUdphu3d9Y+LiA26ET2/jaifL9uoYGGZrOD6erRsS
	 9J01cCFS1PAUQ==
Received: by mail.lokoho.com for <linux-snps-arc@lists.infradead.org>; Tue,  8 Nov 2022 09:05:50 GMT
Message-ID: <20221108074500-0.1.24.5okq.0.vqwvz0tcml@lokoho.com>
Date: Tue,  8 Nov 2022 09:05:50 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_010611_530213_8DA0848B 
X-CRM114-Status: UNSURE (   1.31  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
