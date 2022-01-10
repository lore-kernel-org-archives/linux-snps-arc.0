Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA07C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Jan 2022 18:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufkIL8DX9+BHrZHUihTURPCMsl8Kik7Ls8rFQVNlMTw=; b=zkRQTMDmEkAICB
	45YQSv10JgLaqBNm0Yy0DnaokVg2eReQyjQzufBAbd7m7Ouo4DFuP7N4xfWnWjRPwiCW5SOtaD4TN
	dV3wm196K6rPjTTxBomOdgo54F2oJwKxLUPj/lN1kKcckbQbB4XVJm0mZrWhC2H00IOEHkq+x5fLW
	jUxy1JDSEVEjJr8+J5061usZyPp4MXbFginKKlnfprPhLLA4f6DRx/oGC4FktYwts6dimhgdWb1e5
	uf4vyQ4gHnO+O3wQmz9ArE4ZA1EbjEnijppXaxUrrkqTmVK1c2bcuojlzUzayxGPfSIfQpycxfyd3
	DdXg08Wm2XfZXB7ndeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6zRG-00Clra-Ly; Mon, 10 Jan 2022 18:30:38 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6zRD-00ClmK-L6
 for linux-snps-arc@lists.infradead.org; Mon, 10 Jan 2022 18:30:37 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 04DDAC25BE;
 Mon, 10 Jan 2022 18:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1641839431; bh=SeYTi5jQUqXTwskroHTKN5lM3CJh3xXkmtkvfJr4htI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=G0MEc7PMp9EySy4OX1zU5upVlLHSmoxMzEh28gCk66A1qt9G3Kf1kW/GpTVI1ocoo
 FlVJ6XLqUb5vPh9noi04boIjGllWp/I4fBGUJB/u8DXpzbg0edaIKuQg/xQdoAEkjQ
 h1UeNn64qw77rPy63RgVIZYPIr8CU9LC3FCviRNiLHyh4uk8zll6Tb/X8yrc0vi7Tj
 bjA43yfF2xN8wfyyFafKe6wdqEOWsJG8cbPJ8UPFMaCVqZ3gigQtfAJQUNbOvxqwhN
 EqfdO8vOnFSgXax7c7zWm6Fj6kSNeSK1lLf84EpudcXde/xrLQkqaAiM76sMzfltUI
 ibwrKzUSc+qUQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id B5BB4A0082;
 Mon, 10 Jan 2022 18:30:27 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id F01BD801EE;
 Mon, 10 Jan 2022 18:30:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="c8vxCFVJ";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuRzxUHB2R9nES3mIe/t1c7loomKdlDXuJE6/REHL9sbGkCW1n6TNd/84+OlPCO71oo1jax5k2EsRVpzbo6iT+WJQimr+n4FOMCnGdWat4R9ht8eHrT+dhcYXRbT2RQ9eHGNakzTP/SMqDwro57c8QiOmYJi7xoxtxr9YgjsHuyZX1wwiFaccOjHjExaqQ+G/UgFOYV8bQCzvsROV60h0tTdbr66/Q/AtUcOcZcZjEYK6hH4PFcMRl2hdIr0oI0f1u/n/U+bCcfLzAgHQ7mkYRU06XS+8xSTGfe+KKUZg+wNAJ+muK9dYfZssyO9hBNjg7ipwCQcyGOA0TIaDY0y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeYTi5jQUqXTwskroHTKN5lM3CJh3xXkmtkvfJr4htI=;
 b=SElgUf899Oly0ZcfmRqRgFIvAdO56bxvokL/zXgTiedhWIqTXyc65P8PSKxfHlLjl4HoG3Ac7BXR7mt3+msA66s8qLbgXqd6ni9q+lfhPAfxjWqzgWUu9vFvj5Pq/ISpZxOSnFFA6W7Y7BHDPmiu+enSleGdq9b1u4dSDdEMUGlIV+AFdOXcGWrqe3ZqI2xduQWxoo49P2ukXDgQOhfysyCAbBCfdlqXDLFsQzPi/8pGM9ZSnBQgDZg2B/Tzaq53V5ACs/1w5Z1JE/UG23T4XbeewfICh70scfOuxqPKzj2lAWAki2Ql7wDEXHbNHkRj9wlEOOECaPfPMhBqRcuXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeYTi5jQUqXTwskroHTKN5lM3CJh3xXkmtkvfJr4htI=;
 b=c8vxCFVJAC1FgplDczxxnuXlrSWOyM81VDzQO8Ld86otfBeeBOd7r+0dTlbYWsUlQwY1biABwPO1csiOvVdx3LLpGWvFxaJbLL8muEWis30O3q42ymdHMD94ZkKl3P0BaERB57F//nN2cfeTkM+76QquwADxmmT3vl2btBONUGE=
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 (2603:10b6:301:50::15) by MW2PR12MB2425.namprd12.prod.outlook.com
 (2603:10b6:907:f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 18:30:22 +0000
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::2095:ff33:9d8a:e5f2]) by MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::2095:ff33:9d8a:e5f2%11]) with mapi id 15.20.4867.012; Mon, 10 Jan
 2022 18:30:22 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Paul Spooren <mail@aparcar.org>, hauke <hauke@hauke-m.de>
CC: openwrt-devel <openwrt-devel@lists.openwrt.org>, linux-snps-arc
 <linux-snps-arc@lists.infradead.org>
Subject: Re: [RFT] Kernels for next release
Thread-Topic: [RFT] Kernels for next release
Thread-Index: AQHYAJyrUbgLPNRS5ECg+pktD9/3gKxcmvAJ
Date: Mon, 10 Jan 2022 18:30:22 +0000
Message-ID: <MWHPR1201MB0239C01E0B1A5C409B307AAFA1509@MWHPR1201MB0239.namprd12.prod.outlook.com>
References: <D1B7B4A6-DF52-411D-A712-ED3F2F3692C6@aparcar.org>
 <faa7304a-9ea2-31aa-c3ee-3cfac25fc4b1@hauke-m.de>
 <FE9EB12D-4FC9-4A52-9678-B7C93936196C@aparcar.org>
In-Reply-To: <FE9EB12D-4FC9-4A52-9678-B7C93936196C@aparcar.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 3120671c-cd2f-c93c-1c79-0844225823df
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e413c8f0-c517-4f4f-d190-08d9d4674363
x-ms-traffictypediagnostic: MW2PR12MB2425:EE_
x-microsoft-antispam-prvs: <MW2PR12MB2425E84324D57AF5623FEA41A1509@MW2PR12MB2425.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G7zBAyAy6zEHzW5CjfpHaFukihryVhTq+zoSEdPNDvaXd8xOb1kUDT8p2AVbUiMTVm8fcv+9Jq3f9yUCBLDBBKUpXmIpC1AxWuMzjB2/TB1FPH6Cdaqca0HzZ0y5A19LMVgBw+Ay00S/bcOAYqBZam2CTPH1yWEbuOKSq/gAweMFolZcowZb8Ge58q2Ry0B3vvMPCsf5uVzfVD+ZsqTc56VT2vQCSo4GbFykahkHqwHMrRqUJKIySZEsE2TBggGK2zh67mj5Tj6H6BUjsFWUDcwtQ68o54nwf8YXEufrRmJWP029NQe6fCmXQMPC0ezBHmVTkgcZbobspsf9ytEIPvKifv0RaN8J8hRov+2jTsg+Czkky++P+8yMwZzi8vgo+Wez3/iu6iY/CM/FtpU3tL5o9iRw67OKjch6PsYlG0tH61dAAx9P5o6hwbgqlzcnhdzcTmtMo0vtz8xxRDsFP/MMBgHMIZCQ8gpe8U1Lc6rKwqPxOLzIlll1lpkmQP2uNx+GAV0AKUFDi9BpT8MlBFkjfxC0ddVkstbnwWkZBe4AzspYP6XV6dX5zvodLDtxp+dLarX1v9VsuwBa88Cmm5xE1pG9qABX6DRLRJUAvbSNm8bC1u7M5eMz/0R3EYsZuqR/5dFK+5hM9Khg2456Lz40mKs7GqFztODs7iBFtDl2+hGcDU7ubZQkzj1ScU39DcigZX6fwQHzT7fVRuYWPA+LV0n/Io7DiPgqHzBf3/3O0s5IQM4GPHM95n2elz5jU4b6ydJveWqMoIMrIYtNMEO1l3KWaBjPPoq6VOfr7RhWTWGMK1Bm5PFMoS5G4KRF219goev5ZmFR9gUhI98Kmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0239.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(110136005)(7696005)(66946007)(38100700002)(8936002)(86362001)(66476007)(54906003)(122000001)(6506007)(8676002)(83380400001)(316002)(76116006)(5660300002)(33656002)(966005)(186003)(4326008)(26005)(71200400001)(508600001)(52536014)(91956017)(9686003)(2906002)(66556008)(64756008)(66446008)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8etMtAVG2ptNjn8l/++WOT8UeKjMd08k0gZZWxD2HeadYYec6Bm0SXiJQO?=
 =?iso-8859-1?Q?H1+Tg4MsXwRmgLAVyIpsrrSLSu/A6g/LUY/zJ/JPnpZurHJc0xYpuS+hy/?=
 =?iso-8859-1?Q?muZckhtV/oJc80zQSvTeuuAYh9cDGepayRWLUh+5aGORpdn0Hw0bSZRoes?=
 =?iso-8859-1?Q?oz8hucBGsYxdkqV1RVrSwMI7I5Rj1VMIZ29tl2l4cxgvHJEAc5uR/igT5G?=
 =?iso-8859-1?Q?xr+1nm2K+s/HlEyg5wr6AqnMhTmJyZNqYuXlkx7qpxzNXWUiBIvXV6dpwj?=
 =?iso-8859-1?Q?xaSRX+Q+YxzUQToVJRNNGywvPcKO6ONjTSxRkmWMDg1LwESiyANouW0JPH?=
 =?iso-8859-1?Q?sfgCNtRDDPECD8c9FhL+Xs134Ul1iprjxvLcNxK6FbeSlmMVu7wpYVBCbZ?=
 =?iso-8859-1?Q?jLsE0DePYCQqORwLEk1gWAUhqX/sPVtCpCKvB3LoGVey5er56Yi5H6moFp?=
 =?iso-8859-1?Q?O/6LNgFK/E7bm+PamLyJbRN0rNy6LjBuoXi88GYTuJzvvlRpZJaTnsHyoK?=
 =?iso-8859-1?Q?8f1dHFq+XMboFUFlPPGk9nwicDRlwKKBOgito/t/OIireMOADo5n6y/Qc/?=
 =?iso-8859-1?Q?YgSBLG8g8tNLIxicQrRqxWaALn9RSmM+AWQ3h0G2vt5SftGCQXV7RZ6Ysu?=
 =?iso-8859-1?Q?ZOG5KD/DwgEfAIyzbHTB+SEj+skWbZgcDoXzmnvN3i4f0OQdJZZrkTiWrC?=
 =?iso-8859-1?Q?MfpOJrvQY/qqmIrYlSr2Ne4/y4Q7SXh6/jduvJSfm6vFsSKuEF+EdzbhT8?=
 =?iso-8859-1?Q?5ILOwoRLKw2c79gFC2lBqYsKOksPaIPEQ63MldSpBdsWDDaY/mZnVE2CNu?=
 =?iso-8859-1?Q?3BLTVIvG7vVAATflRqKUmr+8tZ6B1dZUgVxEIsw/6bpQRK8gVfkGn9wvF8?=
 =?iso-8859-1?Q?WEAE7su6IQjsTdrhwVePCIe6C3dYxgCCPQbwDSIUlzH5ucPM+lxcXRNWwE?=
 =?iso-8859-1?Q?spvQ9onyZQQCwbJdHiEOoOBIMNaM88WrmTwa+5Ym2UEQrvg2NITKKeWc7A?=
 =?iso-8859-1?Q?gBhHWsLHOIwSIzvWDWqWaPhqL30VBY+fXVwb3TnAk9NUQfgDAuSlu8vDNC?=
 =?iso-8859-1?Q?ZZWV9aFpB2W/KcenYmXTbjgPrWM9yZe7t8easehyJhU2hfx6rrVGLHekXr?=
 =?iso-8859-1?Q?xUY64+rM9aym3CW6CQLJP21Sytm27Lmg9ugVZatWMWN0n6vk9V//yGyf73?=
 =?iso-8859-1?Q?leDQ64YLHJe39iVgndN8o7KBFEpxZFxeC/+GSwhPPvsFK0SRGF2r7yuRiD?=
 =?iso-8859-1?Q?HI4oeWlLFdUXSUrHL+Pa8wuuH6sEoTMQcmAkAq9HZhEYapFhxzxYi2GCGA?=
 =?iso-8859-1?Q?E7cuLFRRao+dR07ne/dLC7gO2BjcVxN6E7ALzJFzRyPlI2F6Hfh0lfEby9?=
 =?iso-8859-1?Q?NLoFcxn7X+0MWPbPbVHvXSr/1KlUOpKLbyk6RyVY85j4rCpWSP5ASrwaxf?=
 =?iso-8859-1?Q?9XQSBwsOcwQ1Iuq03+2cWXIEBJkvz/Ofm2HU0Qw2cNf3RB5CrDgVorhbjD?=
 =?iso-8859-1?Q?SVz2DSyjuFpEk/dem02yB4Gvyte9Gf74ucLJjFMJhRzjtJuJh5FnpLKC1/?=
 =?iso-8859-1?Q?vaOFy6XkMEkHhvF05IPRVxh9iFPGWioUNgtiekYmPuC3ZBPRs0xq6z/3kw?=
 =?iso-8859-1?Q?/qlzS/606Ch+9iTr8KWri9rKGSqpETQKR2MdA7jt9VNRl5OYCW15xB6A?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0239.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e413c8f0-c517-4f4f-d190-08d9d4674363
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 18:30:22.3221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ej7dAiBXZGzW0dko6dKyiY4PysIUhFinpH4H17WRKF4qXA428k+f0kSWcmI51rfwQiBFeMci6H8pAveaBediFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_103035_853748_5A3246B5 
X-CRM114-Status: GOOD (  19.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Paul, Hauke,
 
> > I would be fine to remove the arc770 and the ipq807x targets.
> 
> I removed ipq807x for now, arc770 should receive a patch within the next days.

Well, actually the original patch for ARC770 posted by Evgeniy some time ago is good.
I mean this one: https://patchwork.ozlabs.org/project/openwrt/patch/mailman.11570.1635883327.1923571.openwrt-devel@lists.openwrt.org/

A problem mentioned in the commit message is due to something in either glibc or
some other part of the toolchain, which causes problems in user space.
More gory details of that issue you may find here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/400

I'm not sure though when we have time to really look into it, as ARCompact ISA
(AKA ARCv1) is being deemphasized in favor to ARCv2 (ARC HS3x/4x) &
ARCv3 (ARC HS5x/6x) processors.
 
> > There is no hardware available on the consumer market supported by arc770 and I think archs38 is the successor anyway. If someone wants to add support for real hardware using ARC CPUs later it can be added again.
> 
> Alexey could you please comment on this? Do you think it makes more sense to focus on archs38?

For a time being I'd propose to keep ARC770 as long as it builds since
there're quite some HW exist in the wild with these processors and from time
to time people appear asking about OpenWrt port for those devices...
Though I don't remember anybody contributing anything except us... so maybe
there's no interest in it in the community really. Then maybe mark ARC770 as
being obsolete/EOL'ed in OpenWrt as well and remove it in the next release cycle.

But given even building consumes resources you may want to get rid of this thing
right now. Then it's your call ;)

-Alexey
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
