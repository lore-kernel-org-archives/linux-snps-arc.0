Return-Path: <SRS0=otmf=CZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201B9C433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2020 07:26:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A5732076C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2020 07:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tZSAfPGk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jM8ubap0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iKSu1C3B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A5732076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+uJqsb8FNwnpbnGWvHBWVDkud8FbsOoNE9hczeXmKak=; b=tZSAfPGkJ8o8CbPzXmCnXIr8h
	w42vQ7rpZdiHPrpCC4Y4JKHAtL0XCR4ZmbOQ0SB7V2WxVFm4uu7TsgNin2gA0AZ2fnqGlUrD9tyKy
	AldtsKNUe7Cd8sLzfEko0r+2GDq2XyNQX2jM1bESWMkDPonYU8lCZSwA/DOT9TE+dynGfYJMPTYiB
	SA1SBa4gIf59GG+cZY2Fym7bVLx2VlQ0wiK4fLXzYMTgCRLknrRIhwxlGNVto274GvrH8s5wq3NGb
	U0rxrwIfMT0QdUhaM/+x2RnHXs6fYEnPt6M6em9uXmYhw+KDbhZUawNgZW8LjxabD9G7vRVuwgtLw
	dA/NY26Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIRpV-0007so-FE; Wed, 16 Sep 2020 07:26:13 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIRpS-0007sL-FQ
 for linux-snps-arc@lists.infradead.org; Wed, 16 Sep 2020 07:26:11 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D438B40165;
 Wed, 16 Sep 2020 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1600241168; bh=twmKzAljEhsFiN3t/VIOPhQupps5FkGw/2gJ66GOT1M=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jM8ubap0H9m3xeEkNQivXK00R0NohiSb3Gy5bDEZKp+LaAgiH8wJfSnLz7MhXBC4q
 lWUxu42IX32ZWdUbKTx8tuWLn4Pooe5NE5ccpBHXpweHS471+lcIXTQNYJsEATIfsC
 C19YOQuDxPdMc+CFwnASjW+HgI8R1X7vYuAneoFoMf7PKGrlY3lAva+MYb5C+bYgmI
 aksiXBMcRtqZlwXWH650MdafTH8I4GkxSGnYq9+Oqt2wstBEIzEg8n2kvyV9u8T18J
 4KJDWPeJgAQ8hZcCCfDOnFvAwOLnBK2NrhvNsN+4f7mjQm62+l1uLedA4Xnciia+RQ
 JX6nzwMCxgKJQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 94257A0084;
 Wed, 16 Sep 2020 07:26:06 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2CDD8801B4;
 Wed, 16 Sep 2020 07:26:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iKSu1C3B";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2FnsuJi+F59l7C4+GWGGROlyz4wsbrARP7EVQhVsELvsc9mAsA8MXu3A+BCHkpUr15o4Q74v/dimP3cFalqOScaA/zXX338yLnILEoEhYKE/PYNBvRb4Z7bSuHXnQETRkZFcxEpKTGc8HQH99Bh+A4RKwsx+SDAIF4djsmG/mk4qFHMDHLjpqGlmsjMOaufxoaTSc9I/udm152thK7JXaWpbx3rBT15XCniosrGAfV/S3gPCpAxnxjdxsSKSG5WW3V5fnM7wwAxSMv8GPAbqbdWKZIpGxagNZ2ofoplj2nje+9fjrnMErbHRD2UhWFNPfSrT/VQ1Ayc7uAMtMsFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twmKzAljEhsFiN3t/VIOPhQupps5FkGw/2gJ66GOT1M=;
 b=hSVkr+8G95CA3v/0Okl5k8bBun5FCacixMDsU0lhbDT0877uIFps5vifajbi9pxbvyya5mxsIHnmMRzziH2A8bU2I9pkHqMb6Jd/3+FomfYY+RY0u1LvQyXuUIWoVqaPd6INhm78uRTnDeRKavdrlDeTJxxaTcA5QHtdpfBEiAdQFdaedECfXPN6pohyHURaaTkbjqusNRPeNksLnyl2A6yMhEaiwDa7/DaF/jMZ1TevYENYfv9D2wEhkBhp3atGgNH6TEIX2gWlE44Bn6TQgov6PQoZZj0BDNtAvbqtJvWLvB7zGKzJf2hXjwr5kqRB3tOpk8hZJyVboQV8249uGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twmKzAljEhsFiN3t/VIOPhQupps5FkGw/2gJ66GOT1M=;
 b=iKSu1C3BX8M7+fQDsKvsYCBE4YnFqSl2hzkiyt4xxTa0zoXh+8BT+ZJexUHtf8r6ZoIH04p46lrdO2KbFqeeNKBwp6660fgi6pf1sW2TbopeF+UW+RBWjPkDLobDUTSZuiX4SSFAIQ7js471Ppow0uwkDdIgpWEAqOAS+G+vvjU=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3480.namprd12.prod.outlook.com (2603:10b6:a03:aa::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 07:26:01 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 07:26:01 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/glibc: ARC: use upstream 2.32
Thread-Topic: [Buildroot] [PATCH] package/glibc: ARC: use upstream 2.32
Thread-Index: AQHWit9N0OB0dIfv2EO5tfcyW4aXM6lps9MAgAD4b4CAACt9AIAAB8IA
Date: Wed, 16 Sep 2020 07:26:00 +0000
Message-ID: <8b275794-f0e6-00b7-7f72-27bbdbe2f097@synopsys.com>
References: <20200914213748.3953423-1-vgupta@synopsys.com>
 <20200915153324.318c612b@windsurf.hq.k.grp>
 <94daa7f5-5780-9716-cea8-a355930e33c6@synopsys.com>
 <20200916085814.1b555f69@windsurf.hq.k.grp>
In-Reply-To: <20200916085814.1b555f69@windsurf.hq.k.grp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [107.3.145.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 708898da-ce04-4619-6dfd-08d85a11c35a
x-ms-traffictypediagnostic: BYAPR12MB3480:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3480E322F6B8EBA8037297F5B6210@BYAPR12MB3480.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PbZASylrzbSXOVFpFEFHxkYNlbeScS6lsgmYUmkAdRuWtJsegQX7trxLsz0ZvYkaEjk4pUfzhOhnyfnP4PVJkJKbQj/pUn7DnpTf2JosNqykgQot3oCMFCmAYujnPSaKRRr1qzdsARRVv2o9g21wSa8qcXq52sutTLLPFO7M5p+YEN3bWbxdTLmLrRQXXLokxrZD9P3f/1PTM2DRAAj1V8QPFTzMSQEwshFpztLrB/iE8v9iNibArX3RvyiBzfVsNs6znld6ulo4NFZOLOTgm4K6kP7Tp40wiQUTLC+Ga1Ey+QSgAUxFZP4DiHvaX/Srl45JsUx6Ts4u2vRj+kopNe2DzvmexPI5YmlsUuK66MZ9YJ/7aQCstXFZ/bmhFgTf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(66556008)(66476007)(66446008)(76116006)(107886003)(26005)(64756008)(36756003)(6486002)(316002)(54906003)(186003)(31686004)(6916009)(4326008)(2616005)(478600001)(8936002)(86362001)(5660300002)(83380400001)(66946007)(6512007)(71200400001)(2906002)(53546011)(8676002)(31696002)(6506007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mLBQe9Yi1ewYq1cBJfLye7fSozTx6XRIshcKAe2Trb6rr01iOjo2+PYaRUhU/lJH2TvTYHAOq873+pg6U//uIWD0ifFBoV9GAtRnrI6QwJMyyvF2/CAcZqpqjdjRci8B9ttgE6S6F35hhazNDRwvCNU/7pT1D5VF3xs4a8k+vEPCJB/3FCrWz3H2AQpY866ecTL8HQdDHyiwZzZRHK0Q5ftjIAXnH0s1V74K+G1zBQ6gYEOFtIGcbln81IIh1rrJ/mryouI+fFXCvUbBb7Sser9NN0/NwoiQ+3JDVtZuAsV8RUzu+C3YEUrCc9ce8jrxInpIyudpy/vfNkrRt73dRH52ytAvJ08AwfYE1wj8X+SpPdKgIE8uQvjw2OEXupEgN3g6jMWiRFo9VvpeglnGpnDNicPCJy6GC34PIqtNrmpDDctkhKICvpHG5pA2nYwtJCcMw6TJBWID0fEnRlQraBbibT2xBYt0fUr77eq5OULXTymVXfjaL6SBCXSwrFRdxe+JiBve6pgOS0JTo+SAWfvKTI/e+cxreYmzQEzGAEH6ry4YsSXzvephEIam+DIU40knFx7WQ9giHDuXwdN3o1e+nkMpE55rP8bIsLaNj2BSwvyON363gcGX2xZE0Rnu4A2q5jvnotwobo3erGEYRA==
Content-ID: <06678E9A8C3D5E4DA8BB93DC517CD4ED@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708898da-ce04-4619-6dfd-08d85a11c35a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 07:26:01.0133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUmZ7fuN/AmixK9smZ5i1OYnnQv4BOJRajiobsGW/QZ9bWRD+yzIKh0OMbRkWJrPXiKyEM2maXIwSP4mSKZX+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_032610_874666_FFCFD014 
X-CRM114-Status: GOOD (  20.27  )
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
Cc: "buildroot@busybox.net" <buildroot@busybox.net>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gOS8xNS8yMCAxMTo1OCBQTSwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToNCj4gT24gV2VkLCAx
NiBTZXAgMjAyMCAwNDoyMjozNiArMDAwMA0KPiBWaW5lZXQgR3VwdGEgPFZpbmVldC5HdXB0YTFA
c3lub3BzeXMuY29tPiB3cm90ZToNCj4NCj4+IE9uIDkvMTUvMjAgNjozMyBBTSwgVGhvbWFzIFBl
dGF6em9uaSB3cm90ZToNCj4+PiBIZWxsbywNCj4+Pg0KPj4+IE9uIE1vbiwgMTQgU2VwIDIwMjAg
MTQ6Mzc6NDggLTA3MDANCj4+PiBWaW5lZXQgR3VwdGEgPFZpbmVldC5HdXB0YTFAc3lub3BzeXMu
Y29tPiB3cm90ZToNCj4+PiAgDQo+Pj4+IEFSQyBnbGliYyBwb3J0IHdhcyBtZXJnZWQgdXBzdHJl
YW0gaW4gMi4zMg0KPj4+PiBUaGVyZSdzIG5vIG5lZWQgdG8gcmVmZXIgdG8gZ2l0aHViIGFzIGl0
IGhhcyB0aGUgZXhhY3Qgc2FtZSB2ZXJzaW9uIGFuZA0KPj4+PiBjYW4gYmUgcmV0aXJlZCBpbiBm
dXR1cmUuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFZpbmVldCBHdXB0YSA8dmd1cHRhQHN5
bm9wc3lzLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAuLi4vZ2xpYmMuaGFzaCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArKw0KPj4+PiAgcGFja2FnZS9nbGliYy9nbGliYy5tayAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLQ0KPj4+PiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPj4+PiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2xpYmMvMi4zMi0yLWczODY1NDNiYzQ0OTVmNjU4ZGNj
ZTZjZDRkMTFlNGJhNjU3NGE0NmY1L2dsaWJjLmhhc2ggIA0KPj4+IFRoZSBoYXNoIGZpbGUgZm9y
IHRoZSBBUkMtc3BlY2lmaWMgZ2xpYmMgdmVyc2lvbiB1c2VkIG9uIEdpdGh1YiBzaG91bGQNCj4+
PiBiZSBkcm9wcGVkLiAgDQo+PiBUaGUgaGFzaCBpbiB0aGUgcGF0Y2ggaXMgZnJvbSB0aGUgc291
cmNld2FyZSBkb3dubG9hZGVkIGd6Lg0KPj4NCj4+ICQgc2hhMjU2c3VtIC4uL2RsL2dsaWJjL2ds
aWJjLTIuMzItMi1nMzg2NTQzYmM0NDk1ZjY1OGRjY2U2Y2Q0ZDExZTRiYTY1NzRhNDZmNS50YXIu
Z3oNCj4+DQo+PiAwN2YzODA0YWJiYzZhMjMzMTVmMDk1Njg2ODZjMGU1YmI4MWQ3MTQyNTFjZjUz
N2QyNWEzNmY4MjZjYWU1NDBiwqANCj4+IC4uL2RsL2dsaWJjL2dsaWJjLTIuMzItMi1nMzg2NTQz
YmM0NDk1ZjY1OGRjY2U2Y2Q0ZDExZTRiYTY1NzRhNDZmNS50YXIuZ3oNCj4+DQo+IEkgdGhpbmsg
eW91IG1pc3NlZCBteSBwb2ludDogd2l0aCB0aGlzIHBhdGNoLCB5b3UgYXJlIHJlbW92aW5nIHN1
cHBvcnQNCj4gZm9yIHVzaW5nIHRoZSBhcmMtMjAyMC4wMy1yZWxlYXNlIHZlcnNpb24gb2YgZ2xp
YmMuIFRoZXJlZm9yZSB0aGUNCj4gZm9sZGVyIHBhY2thZ2UvZ2xpYmMvYXJjLTIwMjAuMDMtcmVs
ZWFzZS8sIHdoaWNoIGNvbnRhaW5zIHRoZSBoYXNoIGZpbGUNCj4gb2YgZ2xpYmMgb2YgdGhlIGFy
Yy0yMDIwLjAzLXJlbGVhc2UgdmVyc2lvbiBzaG91bGQgYmUgcmVtb3ZlZC4NCg0Kb29wcyB5b3Ug
YXJlIHJpZ2h0LCBJIG1pc3NlZCB5b3VyIHBvaW50IGluZGVlZC4NCg0KPiBPciBpcyBpdCBtZSB3
aG8gaXMgbWlzc2luZyBzb21ldGhpbmcgPw0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+DQo+IFRob21h
cw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
