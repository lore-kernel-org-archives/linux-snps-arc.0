Return-Path: <SRS0=lfWa=YR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A59CA9EAF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Oct 2019 18:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68AFA20659
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Oct 2019 18:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3DW4Km1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="doAWeC+b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="bZ0OXksg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68AFA20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HgMdV71+AtUjQ8a0sa3bvPQScVUhW9qQPWWrX++XNwc=; b=a3DW4Km14ZPBu7
	B80DEDs862Xdss3br7MrQIf+Kz0VaEb9Yogza9TGEcx87LIIaIOmO1XZLc0o5mhkDnhp8yU4juCKL
	/6GEcUmwGQ7Av5oYkQEsRsm1G8oaG1W15LEqaIeDJU8guKTAdX7ZSQtOuaZ6w6+yY/S4/P0wS0Mim
	nNPAmiEFbbuP6TeOcxPqvodi2/PhecSq4uDn8thoYCvCBtvNoGuoOH4Ib3AgChAlbAoa+zFjkVonL
	8NB9/8dq5UemRkBKX49T5sGVh8SDh97VM/+vX/7i0e0K4Br3uH90+PQ2Pcc1WV+yz0VYl4uCpVPs9
	YsFuzrn2ET+lixWDTDDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNi9e-0001OB-5e; Thu, 24 Oct 2019 18:48:14 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNi9b-0001NX-AR
 for linux-snps-arc@lists.infradead.org; Thu, 24 Oct 2019 18:48:12 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 18CFFC04D4
 for <linux-snps-arc@lists.infradead.org>; Thu, 24 Oct 2019 18:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571942887; bh=iyKrp7I82f3wYzsbQR/1Jeu1cFgJoa6hSbBVeuarAhw=;
 h=From:To:Subject:Date:From;
 b=doAWeC+buN8P77gCZBO1b5AeZWNEMkH60ln+LU3OMlu1o2jvLFvNcQ5tAfnuBi/nS
 KWABTjNZVnRvyPlZh/WWSIJeebJ74oUMhw1xpDJkq/P2zetZ+7PAs+WyEvVtvRTZC5
 c2HDcyaNNNgdSLyDWSKybOCTgwt8XO9UMnaXRAtRzObO+Ecq4VzOqc93JliFEKyntv
 jteugFbhk0Z2vSj8XUfPK9GX+WhcjkWpM6ceJtabFDPEMjZo1sjacueSer8WgjM1kO
 4tpXqZQR4Wf/GolflCQhZoUJtpTepMUNNwSaMkGrycgtBbxgXkJHTVRJGVVOEuTEy2
 frMGOBLxsoqqw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 92713A0079
 for <linux-snps-arc@lists.infradead.org>; Thu, 24 Oct 2019 18:48:01 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 24 Oct 2019 11:47:15 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 24 Oct 2019 11:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZLKrltTkDM2x23oYm1F7CsOtTcGvX2roOiw6lMy9UfutPDNS+w1UC+PNpxvAiQ+b0jbUqfJXyGRQEJ48XdSMu8UvHrsO2r2IMgY/Wx9upSQXDdm80lJPoY4h1njxMo5bDWb3AjnmlhmI7SQfjyTyAYl+1yRFWq7WYEZ8Uu3S/zwl6wmX8nVIlCEOvmYK1dpvHLTLJVTsI0eR2xCLSXRKqTgW4aqXKeDs+aOhEM7BKzhJ2pRbL2UIVQaV63yQNFjnOz/aKJs+IKyPZdUfg1SxuCHQAwl6apxre+nXEewEnTqbqiAd8c3/6P3YrEbiUBEvfM9Ctq880jt+Uaism6fbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyKrp7I82f3wYzsbQR/1Jeu1cFgJoa6hSbBVeuarAhw=;
 b=QsAolQkXBawubQeFJQpVsEyw6KGQZAKklkHgbqY4qzOmv0Fh+b2Fz32Hhvwp3NrbdOlHOd/BRtk8FCh8DYRXzhYSGjmSrbP0+sdi04AMfSZ9n6fY5XDGQOXrHj8i/tVf5iK+oxMb6LYWj6EaRzzAHNviv2imCEikLM1TeFu2YBL77copihnvKb4DRXcCXs/75HBBRwBwZWlO+L10GTh0y1tjGHv0hFgYnIZID1E2juF7xgRJVb3IG51z0OASsyHPdUDj7KTllaDpJ94acudB/S9qgbjDNAVLHXrfp/oLncviCAPQgF1/wAaS4vPtGHfwRnpgl8lHswf1si0UBmt0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyKrp7I82f3wYzsbQR/1Jeu1cFgJoa6hSbBVeuarAhw=;
 b=bZ0OXksg+StLeswrx6PAfKvU/NWzPukkw9Ex9WtC/Q6CURkSB/Rd2DQijO7lLQjrNA2egYoSpndQzW0/v+56fLhY/hBed6CPShFgStHswLuyhqFQ7hA8OkWcj+XrIAFMVylha4kXLvgUWHrry1+rkhyF10JW/0FTIWtyPRc2bCA=
Received: from DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) by
 DM6PR12MB4220.namprd12.prod.outlook.com (10.141.187.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Thu, 24 Oct 2019 18:47:48 +0000
Received: from DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd]) by DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd%5]) with mapi id 15.20.2387.023; Thu, 24 Oct 2019
 18:47:47 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: arcml <linux-snps-arc@lists.infradead.org>
Subject: test !
Thread-Topic: test !
Thread-Index: AQHVipuH0ejG1RJRbU6sxjMyE39OSw==
Date: Thu, 24 Oct 2019 18:47:47 +0000
Message-ID: <b2b9c3a6-ebf4-a50e-a012-2c824c002843@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb6e5f4-e7b4-42f2-2445-08d758b2aa31
x-ms-traffictypediagnostic: DM6PR12MB4220:
x-microsoft-antispam-prvs: <DM6PR12MB42207DBB442D94F0514926E5B66A0@DM6PR12MB4220.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(376002)(346002)(396003)(366004)(199004)(189003)(4270600006)(6436002)(31696002)(14454004)(102836004)(6506007)(486006)(476003)(2616005)(305945005)(478600001)(7736002)(3480700005)(86362001)(6512007)(99286004)(6916009)(7116003)(58126008)(256004)(621065003)(73894004)(66446008)(65956001)(64756008)(65806001)(66066001)(31686004)(66946007)(66476007)(66556008)(2906002)(26005)(6486002)(186003)(6116002)(71200400001)(71190400001)(8936002)(36756003)(3846002)(25786009)(316002)(8676002)(81166006)(81156014)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB4220;
 H:DM6PR12MB4089.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W69RNhi4yZtA5SowL+UY5EkcwZZ32HwhrIk1RHMyFFEtOE2Dgy0fRkqey883R4F1ikw5lkr0nplr/MuH0sW+pF1JWiRG2tLbqLvL146MyLY5J9aubTTI0NuBzimwsmeWFjkykkM7WTgqG4VF51jIRl/LhAA20jYrCQRIk9bevkOiHNWTC5SbhEcGDBS2C86+F3tydNYMpfdn/0gNZvKzD629gjQ3j0EVqTgwtybnIwbeHMVgOJ2EapkWe7C8IBlHq8+QkWos1s/ZtHqOQfP6lkF5zk9Hw4mMpFXIFKMe3iD4CuqjdnKVFTsC41SEdufv
x-ms-exchange-transport-forked: True
Content-ID: <9F2CBE80A581BF43BB8131B59B144CF7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb6e5f4-e7b4-42f2-2445-08d758b2aa31
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 18:47:47.6674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/wB8c6T+bU+BrqcJgCBCNNI3sQzoGJFzYrgRUX2k9UicobdlIpl1DfPL/wvmbCzRYFhRC8nPYrfxN2gEEXOEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_114811_482449_146F3988 
X-CRM114-Status: UNSURE (   6.28  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
