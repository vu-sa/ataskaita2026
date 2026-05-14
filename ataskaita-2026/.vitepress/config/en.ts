export default {
    title: "Report 2026",
    description: "VU Student Representation's annual report for 2025-2026 term",
    themeConfig: {
        nav: [
        //     { text: 'Congratulations', link: '/en/sveikinimai' },
            { text: 'Goals', link: '/en/mvp/strateginiai' },
            { text: 'Strategic directions', items: [
                { text: 'High quality studies and its environment', link: '/en/kokybiskos-studijos/nacionalinis' },
                { text: 'Strong organization', link: '/en/stipri-organizacija/tyrimai' },
                { text: 'Sustainable University community', link: '/en/darni-bendruomene/renginiai' },
            ] },
            { text: 'Community', link: '/en/bendruomene' },
            // { text: 'Acknowledgments', link: '/en/padeka' },

        ],
        logo: {
            light: '/img/logos/vusa-en-b.png',
            dark: '/img/logos/vusa-en-w.png',
        },
        sidebar: [
            { text: 'Congratulations', link: '/en/sveikinimai' },
            {
                text: 'VU SR structure and principles',
                items: [
                    { text: 'Strategy', link: '/en/strategija' },
                    { text: 'Parliament', link: '/en/vu-sa/parlamentas' },
                    { text: 'Council', link: '/en/vu-sa/taryba' },
                    { text: 'Institutional Strengthening Fund', link: '/en/vu-sa/isf' },
                    { text: 'Revision Commission', link: '/en/vu-sa/revizijos-komisija' },
                    { text: 'Data Protection Group', link: '/en/vu-sa/dag' },
                ]
            },
            {
                text: 'Year plan',
                items: [
                    { text: 'VU SR goals', link: '/en/mvp/strateginiai' },
                    { text: 'Goals in VU SR units', link: '/en/mvp/tikslai-padaliniuose' },
                ]
            },
            {
                text: 'Implementation of strategic directions',
                items: [
                    {
                        text: 'High quality studies and their environment',
                        collapsed: true,
                        items: [
                            { text: 'Representation in the national space and city government', link: '/en/kokybiskos-studijos/nacionalinis' },
                            { text: 'Representation at VU', link: '/en/kokybiskos-studijos/vu' },
                            { text: 'Cooperation', link: '/en/kokybiskos-studijos/bendradarbiavimas' },
                            { text: 'International cooperation', link: '/en/kokybiskos-studijos/tarptautinis' },
                            { text: 'Papers', link: '/en/kokybiskos-studijos/rastai' },
                        ]
                    },
                    {
                        text: 'Strong organization',
                        collapsed: true,
                        items: [
                            { text: 'Research', link: '/en/stipri-organizacija/tyrimai' },
                            { text: 'Projects', link: '/en/stipri-organizacija/projektai' },
                            { text: 'VU SR process renewal', link: '/en/stipri-organizacija/procesu-atnaujinimas' },
                            { text: 'Institutional strengthening', link: '/en/stipri-organizacija/isf' },
                        ]
                    },
                    {
                        text: 'Sustainable university community',
                        collapsed: true,
                        items: [
                            { text: 'Community-building events', link: '/en/darni-bendruomene/renginiai' },
                            { text: 'Student initiatives', link: '/en/darni-bendruomene/iniciatyvos' },
                            { text: 'Integration of students', link: '/en/darni-bendruomene/integracija' },
                        ]
                    },
                ]
            },
            {
                text: 'We give our thanks',
                items: [
                    { text: 'VU SR community', link: '/en/bendruomene' },
                    { text: 'Report project team', link: '/en/padeka' },
                ]
            }
        ],
    }
}
